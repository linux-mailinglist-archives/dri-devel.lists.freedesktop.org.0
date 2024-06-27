Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB991A026
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9616110E173;
	Thu, 27 Jun 2024 07:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="W6OHZgmA";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="m7ToQ9bv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1B289190
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 06:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719469975; x=1751005975;
 h=from:in-reply-to:references:date:cc:to:mime-version:
 message-id:subject;
 bh=WlTXNyPCXJS+3tR4ae7fOKY/+tOrO1vba64eSNybt7U=;
 b=W6OHZgmAqQdWGbpPCWLKYEoYAGnQhU5AcfzfCF4tLbNnpci4mIPwCmks
 ZoDf+QAlZ8010b2cl74zdMw6gm8sbLTRWhVbMAK0PmLNK/PLkBYb6jDOu
 FPwfcA4hvJlhPe5JuIXn0D1T4hAf4yx/+obDlSaXKMV6sD+4o3zQV5NhT
 RS/qktgH2e8VytGhO+sdRDkG+DoYGACwjvMVGMAW/FGjwmfqkFoTchltL
 l7mTgu7bqvzzMmcty9w2pYE52MGDl35eSCYzlCqiCeUyi8ojJF2TqHpvh
 KLArn4Ct64g0rsA2x2upW1Ne28EYV++4N0PnYMoT9pyMGNYihaTxciD7e Q==;
X-CSE-ConnectionGUID: u4CY34kCRVOPsKgqZ3+jYw==
X-CSE-MsgGUID: +M6buoxcQT2AUqLRk9Hp6g==
X-IronPort-AV: E=Sophos;i="6.08,269,1712613600"; d="scan'208,217";a="37613209"
Subject: Re: Re: [PATCH 1/2] dt-bindings: display: simple: Add AUO G104STN01
 panel
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 27 Jun 2024 08:32:53 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 0275F16406A; Thu, 27 Jun 2024 08:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719469969;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=WlTXNyPCXJS+3tR4ae7fOKY/+tOrO1vba64eSNybt7U=;
 b=m7ToQ9bvGxmmE9yUrKgeK/M5mkKUAilF73FPo7n6U+u5p3BORH058nB85UAHvQM7o+Sl+5
 Y9VWLGoiSNWTjIXFTmsnftjPNtVvZX3A1m2ZSH7sVwwd19zsRJ9ZfGvXAQvqMZZeEkkvHB
 rJVjHHX/ONb/zo1wwzJ8eTfcbnNlLKu5ZL6Z/axNw6TMQbpUkjr6YtE/rrx5RZBMVOo6Cy
 1vi0dzeghmDI1VAtbaBsozK49n/Tk0nkVaEr4wt/kU7T3WUtVu69UZQk+36AUNqHx1Ind2
 Gqd1uqfBCl3ZQqqnIXdCs1Uhm2lRCnDPMHC86uSuCF2NvyjzyLNhdBISQ4H94A==
From: "Paul Gerber" <paul.gerber@ew.tq-group.com>
In-Reply-To: <8dbe4a2d-3d25-460a-8fa1-3511d315a901@kernel.org>
Content-Type: multipart/alternative;
 boundary="----=_=-_OpenGroupware_org_NGMime-71-1719469964.655873-1------"
References: <20240626044727.2330191-1-paul.gerber@ew.tq-group.com>
 <8dbe4a2d-3d25-460a-8fa1-3511d315a901@kernel.org>
Date: Thu, 27 Jun 2024 08:32:44 +0200
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Sam Ravnborg" <sam@ravnborg.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: "Krzysztof Kozlowski" <krzk@kernel.org>
MIME-Version: 1.0
Message-ID: <47-667d0780-3-2796f200@113848705>
User-Agent: SOGoMail 5.10.0
X-Last-TLS-Session-Version: None
X-Mailman-Approved-At: Thu, 27 Jun 2024 07:14:37 +0000
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

------=_=-_OpenGroupware_org_NGMime-71-1719469964.655873-1------
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 1332


Just realized a mistake in the bindings patch. The explanatory comment =
needs to be above the bindings entry and not, as I did, below. I will s=
end a V2.

Best regards,
Paul.

On Wednesday, June 26, 2024 09:36 CEST, Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:On 26/06/2024 06:36, Paul Gerber wrote:
> Add AUO G104STN01 10.4" LCD-TFT LVDS panel compatible string.
>
> Signed-off-by: Paul Gerber <paul.gerber@ew.tq-group.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

<form letter>
This is an automated instruction, just in case, because many review tag=
s
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", whe=
n
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/=
submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof
=C2=A0

=C2=A0

------=_=-_OpenGroupware_org_NGMime-71-1719469964.655873-1------
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 1710

<html>Just realized a mistake in the bindings patch. The explanatory co=
mment needs to be above the bindings entry and not, as I did, below. I =
will send a V2.<br /><br />Best regards,<br />Paul.<br /><br />On Wedne=
sday, June 26, 2024 09:36 CEST, Krzysztof Kozlowski &lt;krzk@kernel.org=
&gt; wrote:<blockquote type=3D"cite" cite=3D"8dbe4a2d-3d25-460a-8fa1-35=
11d315a901@kernel.org">On 26/06/2024 06:36, Paul Gerber wrote:<br />&gt=
; Add AUO G104STN01 10.4" LCD-TFT LVDS panel compatible string.<br />&g=
t;<br />&gt; Signed-off-by: Paul Gerber &lt;paul.gerber@ew.tq-group.com=
&gt;<br /><br /><br />Acked-by: Krzysztof Kozlowski &lt;krzysztof.kozlo=
wski@linaro.org&gt;<br /><br /><br />---<br /><br />&lt;form letter&gt;=
<br />This is an automated instruction, just in case, because many revi=
ew tags<br />are being ignored. If you know the process, you can skip i=
t (please do<br />not feel offended by me posting it here - no bad inte=
ntions intended).<br />If you do not know the process, here is a short =
explanation:<br /><br />Please add Acked-by/Reviewed-by/Tested-by tags =
when posting new<br />versions, under or above your Signed-off-by tag. =
Tag is "received", when<br />provided in a message replied to you on th=
e mailing list. Tools like b4<br />can help here. However, there's no n=
eed to repost patches *only* to add<br />the tags. The upstream maintai=
ner will do that for tags received on the<br />version they apply.<br /=
><br />https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/p=
rocess/submitting-patches.rst#L577<br />&lt;/form letter&gt;<br /><br /=
>Best regards,<br />Krzysztof<br />&nbsp;</blockquote><br /><br />&nbsp=
;</html>

------=_=-_OpenGroupware_org_NGMime-71-1719469964.655873-1--------

