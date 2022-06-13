Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4254998A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503F510F3A8;
	Mon, 13 Jun 2022 17:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFEB10F3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:08:31 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso6551557pjh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BRUSjFdf8caOJguWY1nnRjK6EgjDSSb/DcnbNJxP1U=;
 b=Z9+9G1BG+p/hKmV549g45O1q4VTqeHS9IUrmT22Diyg8hnpEq3eKWEmbYwLsTqH8Qu
 9ECPevoZeRVGZtzmojLDSx5sWRIxe+riGIZYFwz3Gz9lJ5PyZIZqNA0jjx2G2ozgUkSf
 x3E1RI7YsADCBaiPBejRF0CCHrGtHoy1o01FCTgy3TomkX+RfciG5Y1KZa3oAaaWzHFv
 Fq6snmnZpfw6hhQYmSVeWQfHfBZGyoZ1lqNWC10aY4+CXUAqsu/jA1HSyci1zCKrGhiT
 HrZOdZm5EKfHXNhnyF+yHeHy4VEiSGI1ohF+IymKeG8AafLmv80KvxGho1trQwwEey9F
 U84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BRUSjFdf8caOJguWY1nnRjK6EgjDSSb/DcnbNJxP1U=;
 b=Dp7vA5s+bYYWq6x968P/iePmVGja5nuf0Epd91ZmP4gZdUjAUqurYnT/0GaqAPOFiW
 E1Qc0oa1ymJ3nSOqqhu9FQ8u4zsXyH1ed182SF70KS06ruoXCvVXht403bk8K3aB2f3r
 otqk39u1tyWblNOa/TJ1Gp2ZSRS1S4/YWdgOqKo2uB9DrMDfRax2DVVKK4pbDnS69gbG
 VgPN8dJLnRgN9xmMnyMnrCrJ1llTYzzVq3LseP+7g9GzwV9zowme97ubCZKneo5FbUd5
 p2XCsHYnwTwUojw36OS8KGERGU7JjCFbrAysu+NZ618dc5O4GcvJyThF++NHrGOQm/EZ
 9EEQ==
X-Gm-Message-State: AJIora+AmYASxDf5gzEXZ4wz3hjTjQ8mEXXp1OwTfOQ+I+IM/X/WqHmK
 7KUga0tkB6XQFYZgTpANvlw=
X-Google-Smtp-Source: AGRyM1s9m5eBvIotPjXn9XSZIR3fmtaxBpNZ89CJ3IkrEwLct92plDWrHE5Fs3tNekbPUW1ft43uFA==
X-Received: by 2002:a17:902:6845:b0:168:b675:39e2 with SMTP id
 f5-20020a170902684500b00168b67539e2mr286379pln.33.1655140110977; 
 Mon, 13 Jun 2022 10:08:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 ay21-20020a056a00301500b0051bc3a2355csm5615228pfb.64.2022.06.13.10.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:08:30 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
 Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, javierm@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 5/6] ARM: configs: Enable DRM_V3D
Date: Mon, 13 Jun 2022 10:08:28 -0700
Message-Id: <20220613170828.238070-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603092610.1909675-6-pbrobinson@gmail.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <20220603092610.1909675-6-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  3 Jun 2022 10:26:09 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> BCM2711, the SoC used on the Raspberry Pi 4 has a different 3D
> render GPU IP than its predecessors. Enable it it on multi v7
> and bcm2835 configs.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/defconfig/next, thanks!
--
Florian
