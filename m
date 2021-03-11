Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEA2337335
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951C66EC48;
	Thu, 11 Mar 2021 12:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA28898A8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 11:24:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hs11so45477230ejc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BigjSlhOeprsXx4neHUCGwnpc3gne5HdTbZQCp0CX+4=;
 b=nALRwWKTtHx0D/2PpdF42HuXoImFMEwHGyPudZGDjhc51D/fin6UjUpFHmJMYm5h0w
 1OpCJO08sS22QWR4LOJry6eJF99zEGlZgWjPjtSxv22vZdzxq0nXumxQ47eURX3ZWMn4
 0aduXxnuj2j1ht3fzHu5YBuUDjH+ySXNx6UgcZu7o4iFcA6IyiZL4De8BV4S68/p9Mqb
 9ph4hZFILllRqF0GOlSaUYiEn5Iu5f5NEbLmbOQY/lBu7iA+GL5Mv3obDg4aYRNiggO0
 7Y6dnC2EupVUPwP6X1AiN8LnLho/Xkyryc3f1wiHkbBDt2frHR/dQc+VNmyDMlsDJiRJ
 EChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BigjSlhOeprsXx4neHUCGwnpc3gne5HdTbZQCp0CX+4=;
 b=lo1sll7cEppiXJ89powHKIccgB+H4gp6EAyZ1mLuho4y+lw4BdDsnmwtSv4tFj1q8X
 lbU6YbfUyUP2eIAvfhBPOnnu5xMkODact/ZgQ8Rg6KGDLxJHXAtAL4cjyVxxjRub8dgm
 0dhOBsT+CpWvKZ1X/K1XS7LPHIt37ECdHHj96T3+xhYyGAc90TknE4JhRpIXVDJeUfaY
 rFCj1RU6nzQHSfXfyQbOhiGEwj6Fm+rRSglJWmMrzGTWFcXYNpG1rweWdm2O0uh3gC6M
 xF8xuoD/pdK2B3Er+1FBsZX/TQ43IH3LAV/cRouipZnOHmXkE/d1NOhs6eXbmwTy3t+A
 mzyA==
X-Gm-Message-State: AOAM532KnYrpK04HEw5qsJgseWPq40RnveD6BQJllhmbE7W0go3aJN2t
 JtJebvkEKpOvy5oHV63ulT2pqLnpITv4D3ma0Jk=
X-Google-Smtp-Source: ABdhPJyh7ZbVklsi5BUCrRjiM7J7HpMvcn3nhMBMr67yz0arbO28f97q4MA/3DjPHvJeyjCyMPgJFYNi3uFRqxMqJvQ=
X-Received: by 2002:a17:907:7014:: with SMTP id
 wr20mr2640860ejb.179.1615461857107; 
 Thu, 11 Mar 2021 03:24:17 -0800 (PST)
MIME-Version: 1.0
From: Yauheni Saldatsenka <eugentoo@gmail.com>
Date: Thu, 11 Mar 2021 14:24:06 +0300
Message-ID: <CADj5-AzOcOBiVXL+QgAPRhMWF+k5WS5TvECOSdDeZPtQHSgvRQ@mail.gmail.com>
Subject: [BUG] STM32F469: vblank wait timed out on output to
 /sys/class/graphics/fb0/pan
To: yannick.fertre@st.com, philippe.cornu@st.com, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, airlied@linux.ie, daniel@ffwll.ch, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
X-Mailman-Approved-At: Thu, 11 Mar 2021 12:59:37 +0000
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
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1862997935=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1862997935==
Content-Type: multipart/alternative; boundary="00000000000024232b05bd410622"

--00000000000024232b05bd410622
Content-Type: text/plain; charset="UTF-8"

Greetings!

I've created a bug on bugzilla related to stm32 drm driver:
https://bugzilla.kernel.org/show_bug.cgi?id=212229

My experience tells that personal messaging is more effective, so I've
decided to contact you personally.

Please feel free to ask for additional information about the software and
hardware environment.

Best Regards,
Yauheni Saldatsenka

--00000000000024232b05bd410622
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings!<br><br></div><div>I&#39;ve created a bug o=
n bugzilla related to stm32 drm driver:<br> <a href=3D"https://bugzilla.ker=
nel.org/show_bug.cgi?id=3D212229">https://bugzilla.kernel.org/show_bug.cgi?=
id=3D212229</a></div><div><br>My experience tells that personal messaging i=
s more effective, so I&#39;ve decided to contact you personally.<br></div><=
div><br></div><div>Please feel free to ask for additional information about=
 the software and hardware environment.<br><br></div><div>Best Regards,<br>=
</div><div>Yauheni Saldatsenka<br></div><br></div>

--00000000000024232b05bd410622--

--===============1862997935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1862997935==--
