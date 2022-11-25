Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581F6397E6
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BF910E167;
	Sat, 26 Nov 2022 19:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774E410E789
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 18:16:53 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id h193so4531911pgc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U61PbKW05jYz9l60M6WT1lvaamndgipieyYOdFsydYY=;
 b=XIvESbp9tmgh1I3jE1Gn0K3Cf/iTfbhRmdysRGKWGWseHftrN36WvBEs5LtD03AiyT
 tmQGKLv4u7jEUzxNnLXp4uOxR/5Y5UcK+7tjncYtbB5UUrbFNhSLdn36uqGiqdhLYhCC
 1q92EUpCrkxyjgTNbdh1dksrc5CPhatrv55Ydcfnz/S83blJpiSnvq+CyrmpQS8srls1
 fNtrCr8Z+pBGTMXps8qn621aeoPqGaUOJmSqIfI/0Tyl8KWdxFuyl8PyYmnhp0k8yv4F
 jaSE9lVfJNOZ4+psOAfq33BtRY+xsLKVupwB/3VTbxE5o4/D+FOZ1SkQ3DOglkgIG6pQ
 Ryyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U61PbKW05jYz9l60M6WT1lvaamndgipieyYOdFsydYY=;
 b=nGK3WBjlbHZvyBkIe75RFakgmx633+XVJupc3DraJJVO6lREDyQJR4kZEqPlGNcC4o
 vzVWZiYJUYNM03t/SQVhIOKwfuhXtpvF5Cj0CF672eto57r8rK13hqxPXbuWYVFrn9TS
 KApfVPDXpLupATwQHsOF7t7ACOz9QD/cgoeCzwW+sJvS/1nDOdJHiVgKgGbbzyHkmgFh
 mewQHY7GEJTrE0Ml/MFR68vJw3x7iuuDvVwaJBYY5331M9Fi6VpuqHYtPv75FwbqdD9t
 4M3NgDzSV0wMQSltpuQ5CMZbxg3wpZ+au5BhfpzGZBM872OH4ipoqfXh/7ydUMorZywJ
 2GVg==
X-Gm-Message-State: ANoB5pmSHRev4fNTjOcWqUR/XK6DsBcZFx7uHP9NLJHjUyRYLljCtlnz
 xIo78BOkh0tla4H3Cj35aRtEZM9sBKVY5nuErGc=
X-Google-Smtp-Source: AA0mqf5pcMU+OZhibbISCZKF92d8A0KoAl8CBmbCbsg2q8d/AcA48BfdqIY7hQ3yIbrUTtAiNLgc2Da/ElBhX4Ww5fc=
X-Received: by 2002:a05:6a00:2403:b0:572:698b:5f69 with SMTP id
 z3-20020a056a00240300b00572698b5f69mr24258628pfh.54.1669400212937; Fri, 25
 Nov 2022 10:16:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a21:2d0b:b0:a6:57b6:b6d4 with HTTP; Fri, 25 Nov 2022
 10:16:52 -0800 (PST)
In-Reply-To: <81722eba-3910-2117-8b07-bb030ab754dd@gmail.com>
References: <43ccb0fb-119b-1afe-758b-e413729dd704@gmail.com>
 <81722eba-3910-2117-8b07-bb030ab754dd@gmail.com>
From: Affe null <affenull2345@gmail.com>
Date: Fri, 25 Nov 2022 19:16:52 +0100
Message-ID: <CACYkpDr204QaCEmfFfuVH_=CWxH6mRixeRoyv6QXav9T7YP-sQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: mipi-dbi-spi: Add
 missing property
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 26 Nov 2022 19:00:23 +0000
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

Sorry for the spam, unfortunately I can use neither git-send-email nor
Mutt with GMail, so I had to use Thunderbird for sending the patches.

Regards,
Otto Pfl=C3=BCger
