Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B630275E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 17:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A096E250;
	Mon, 25 Jan 2021 16:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1028F6E250
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 16:00:31 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gx5so18754303ejb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 08:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vRfnd3x4qfO/NcDdIVuwgYzfbRdF2ny2WJ0L3qydKao=;
 b=XYuhKitZOpt2uLxv4j+TWIo1kDBU2An7GSfZ9fIhC5+dUkqeqPWhnibhZ77cMsjK3B
 xBZchIOrcHIcJp/v+Z1+K8euPmyHDZpEzKj5Hy/28R/tBWvp9CTzRIjxxjMxA0p7SRPo
 YGDfIHZOQ4FRpXIW0BX15ahasgrpLSctl1SmOEHgw9zdbqKtCWLFd6IKVXZUXJ3tkbiN
 v50V0+OruNFdcB2hdVWz3V/BfHuv0ue00MuMqnPfVEZBG4gpuYRfmdTlZLa5lyKSFbU0
 VMb5/yMFbqlePie5w9Gv58fHl3Tr/mF4iLQObFO4Ci/uqZKm/Tg8eTBy+dpY0t9Jqw5F
 RtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vRfnd3x4qfO/NcDdIVuwgYzfbRdF2ny2WJ0L3qydKao=;
 b=QD8fd6objl8Why74wIbbn6nCl1DfiFEKrFMStMpB9bk+2JGn9sMbZ8Oajvw1HQtDX0
 lKxOUDh+kESFUZoU3U8BXC1eJhcL00+m62jIJOVjsYEculOZ/XpZOORhNDZH5ur6pBya
 jfKMpatYsm7x8/H8+2hTIfU7AKBlulEJ8zmTLxbrqhTTCteUyIzeOJolKHtySyGoeeSM
 ecxEuJUqZEDK8X7n+B8zuuiwkFwqqiVA/wHxFd138hUBbMV1hl8GoLep6y41qbOCGwO3
 1+ONlOw16unQRDYYKeb3fqagrY3XbytkKEj8ZESZ5GOsG0/rEKzwPRfT6F3RGn+LrHNh
 4zOA==
X-Gm-Message-State: AOAM533W9eDe4a7o01HGIScRDP8UuDQxecIh/oOionZbqfzxmWG+QdEn
 TEI8XgR9l3QVXINaCiS2JEV7y1OL8NZHo8UtdKg=
X-Google-Smtp-Source: ABdhPJyv9XBSC8fIz3zN1x7K138xFGah4IfL4mAHR8/ekqdA5o0ZCrCos60Jnv2oqlypzni0E33OXr0P2n511BT/QTU=
X-Received: by 2002:a17:906:7947:: with SMTP id l7mr819012ejo.5.1611590429676; 
 Mon, 25 Jan 2021 08:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
 <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
 <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
 <YA61Aa07PhDucMyG@intel.com>
 <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
In-Reply-To: <-NvMjiGAV79IMWvTOWrb2u_SHe2U36XumXbITMgCCqpMVg-FcvGRJbeTHaiUwkBSxZS5XaXYziZnoTdXJENA-JYQWNi-28F01___0SsWvv0=@emersion.fr>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 25 Jan 2021 17:00:18 +0100
Message-ID: <CAEsyxyiK+bDyLDsk-jG3GGYWBjkGZeFamutmtDiNYvJSm4qegg@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
To: Simon Ser <contact@emersion.fr>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0479512129=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0479512129==
Content-Type: multipart/alternative; boundary="00000000000015994005b9bba3d0"

--00000000000015994005b9bba3d0
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 25, 2021 at 1:14 PM Simon Ser <contact@emersion.fr> wrote:

> > This is not an uapi defintion anyway so fixing should be fine.
>
> Oh, my bad, I thought this was in drm_mode.h, but it's not. Then yeah
> should be completely fine to fix it.
>

Good! The beginning of the end of a sad story ;). So i guess i can get your
r-b's for it?

Will this fix propagate into igt and libdrm? Or are separate fixup patches
needed?

Simon, could you let the Kodi devs know in case you have a line to them? I
didn't know that there is even one more real-world HDR client for Linux,
apart from AMD's amdvlk Vulkan driver, which does things right and doesn't
need fixing.

thanks
mario

--00000000000015994005b9bba3d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jan 25, 2021 at 1:14 PM Simon Ser=
 &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">&gt; This is not an uapi defintion anyway so fixing should b=
e fine.<br>
<br>
Oh, my bad, I thought this was in drm_mode.h, but it&#39;s not. Then yeah<b=
r>
should be completely fine to fix it.<br></blockquote><div><br></div><div>Go=
od! The beginning of the end of a sad story ;). So i guess i can get your r=
-b&#39;s for it?</div><div><br> </div><div>Will this fix propagate into igt=
 and libdrm? Or are separate fixup patches needed?</div><div><br></div><div=
>Simon, could you let the Kodi devs know in case you have a line to them? I=
 didn&#39;t know that there is even one more real-world HDR client for Linu=
x, apart from AMD&#39;s amdvlk Vulkan driver, which does things right and d=
oesn&#39;t need fixing.</div><div><br></div><div>thanks</div><div>mario</di=
v><div><br></div></div></div>

--00000000000015994005b9bba3d0--

--===============0479512129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0479512129==--
