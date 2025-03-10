Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F51A59BC5
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 17:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5179810E48E;
	Mon, 10 Mar 2025 16:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yq3ZF3rV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0039E10E492
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 16:56:18 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2255003f4c6so34300735ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741625778; x=1742230578; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=APYb9FkXg1vRuxJSuYQo7eXa16DnhsCOqDRxqHiUv+k=;
 b=Yq3ZF3rVixKzBumprG7Y6ghjhCCIwp8DPFFj7vymA3u7QpiwVK3yYx9w1JvylX+rDt
 vN0i/SRVMC/LG4gD6Wt7cvP0MoLXflljgnxTtzWrLDgpZGhPkKrl2dXwgP/TQb4TpXAA
 YORWUaNq1CnJDKwZ2y05XOlPRzKBYTO5Gbqf2SHIL0UMiJpLjl5S6emNQo0P6jh86oqO
 /83oa0uL9s4F2VNmtIBV4h4jT9zcXow7jYZUh/5I1L7T9JItjIBMwGDxpm6rPiHfinpn
 o2XYlrW4BbCHsLz2DtojWOzlFlBKzex5xLb4kwy/i3n46qAdw9V6k/OcTc3tjQXnNUVP
 76mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741625778; x=1742230578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APYb9FkXg1vRuxJSuYQo7eXa16DnhsCOqDRxqHiUv+k=;
 b=XXQB5hAMFW0Q+4wCPsQf2rPUdHkLRw57GH/c+QnK+/Mj6Y0s2YFklHD45gfl0ezOPF
 9JMky3L6zGndJYe3EsJWgLMWU1erCsidwdSrOPFQPLtfINhr3o2uS8R06KtGSxEWEqiV
 jVHgT+Iw6NCFSD+X+LD2kBO0aoyCOfwz70qylc2LvlP5gjQtANsPY+b3xSeSy6XYPD9K
 KRuwJrcMoBHNeua3rr6CLyjTsrIFFPLPWs5aRcn4rWobjogbncKFw90o8TBaonqt4sFM
 A1BvVOzkxC/68LLvL/V3PXakldCE08ZU/BJnljHcaPbj1b6UP8dVxlFNvczpoaCCJI6r
 qOow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTrSiOgPNLk7qifg6Vlb6aTyCYPa+vQoIVBdh68MIbnD1r1cAOoM84v0AjZrZQEmVraSfN3NtHXa8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6DQmd9xuxu/OOL81u1BKL9JOW81pG8iCLNrCsirGuaysvGzns
 WJWxWJ6k5UBEI4zH3dqTVUJmT8vzBDAalNqBM2qfabA6Y2HQqQSs
X-Gm-Gg: ASbGncvF28brVSa5GgEMKVT3VYs3NvhM8i0ZpySDDZxUcy292UKVTMboLlaS7exXiGc
 NKfm94Zqh0rUjWlKpZgOE0wRpwMmr2xo86nSbm0IQtR/E5nllIBIcToHLanYRUcdQeGM4NJUyW0
 QKl2zXPaZkU6xrT0/cGKjIJ1MEGD2U+yeT4A1vgAAbtelk3ilauxB6RRc7BSAGqSUwqBLNIW63v
 mF/G4xM31is1xBZO36S+n4k7F5ArswpRVJryCWKdmIwG2gEaoZHxr44PqlFd6DPo3OGAq1J9FG+
 vcU04qi2Ui5wgti7zw/3Ru4i5RjU7AzpHfGa4mA59LBh
X-Google-Smtp-Source: AGHT+IHYlGgo1/vzV4si4Qn81FbyVTTf4l8pjPxaAUEx+//suEtoprSuUAAYpRMpt6VXcEwCFKWneQ==
X-Received: by 2002:a05:6a20:db0c:b0:1f3:4427:74ae with SMTP id
 adf61e73a8af0-1f58cb46b0amr604930637.25.1741625777842; 
 Mon, 10 Mar 2025 09:56:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eb9f:29c2:9ede:46d])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28126e09dsm7864964a12.53.2025.03.10.09.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 09:56:17 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:56:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux@treblig.org
Cc: arnd@arndb.de, lee@kernel.org, sre@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, alexandre.belloni@bootlin.com,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de,
 linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] Input: pcf50633-input - Remove
Message-ID: <Z88ZroxO32c0HLV0@google.com>
References: <20250309193612.251929-1-linux@treblig.org>
 <20250309193612.251929-6-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309193612.251929-6-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 09, 2025 at 07:36:08PM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please merge with the rest of the changes.

Thanks.

-- 
Dmitry
