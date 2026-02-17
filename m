Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNUwEemflGknGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 18:05:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA7A14E82A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 18:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DDE10E524;
	Tue, 17 Feb 2026 17:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OhcPBY72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D008D10E524
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 17:05:41 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6581234d208so7466889a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771347940; cv=none;
 d=google.com; s=arc-20240605;
 b=lKsoOy51+/UbizWEWI/f/khw+hocPzJju2rLmRbKgRfcz3I6PI22teNI/NL587U63O
 QS8dAgYceEsCOrV+0d90mO1zoy8K1qe8eBRgPhuNyxoPuBRzEaoQXjVYy6V4nBOVfJ5X
 DZNsG/qoD5iy+Nh9V+ANEXRHavDN3lkIo36YoIYGCsNNDqoQOIiHfxJdvXZFv5zm2j/v
 x24S7n9iuwRRxm9QtHLRiFAyGO2C8OWb40+yC6WNqfg2aKCQrhzzdsM9N/iSha9MGCOT
 hDz5qV0+GfxhKPsClV5YxWxgNa6azep7QvFHwo+zDYHLMY7gnU4mhtQ+g2/qBPblKa+I
 JH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
 fh=HyfZV7yzk/S43QL/+uHsg6xBqIFpS0G9/jOR4OKOvTc=;
 b=G2Rik7HsB7UPfExaOFZ1IR0ar1XvZwryND5tb6zepNd0aoRTNS1Hgi8+TZ7jl3f5VT
 qUzg+85pwdxtWOZPejV55KUEg1IkHg1+JG8+HVntL8fuz+3Uw2uznsBXFwdyzAAz99n/
 fRV/YGua0uglEdr6TfmRv7uMPX1zvH5rg1c5sB9OhP9VEq/jGXrxVbtUwLwt3oT70M8p
 h4M8mQtYFVpXO/R7MMG/ApDohg9zudfUjll7l1SOsZGxbZSzBaOAEJ+llTkPUzEHIqI5
 O+9/ZlCMWaLc3Fx2+eoQGkaGmC9y/wm+ei7/7BndLoQYNKirpyp5w8ieJMVE1w/KJPML
 mJ3w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771347940; x=1771952740; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
 b=OhcPBY72/eTNsRDflDuqTWR1P7D9qdzioBNDorJlTvtOzcC+jrELftVWiA0h2eV4eW
 QO9xBPRPZOG9T/osmjYtyYaOnBkVkUFm/c9Ydsn775gCe4khoeyPItqcj2ULrwYPJqsL
 +1KXtdW67ZhqlN4Uxsmvmot0gwwrG6IO44ZhtzpkZoq9BtAdQ2MwrA2zNg3wm/xIb1ON
 23rGl6mJgRxnFGbd07fCNKBiVcK2OrGDc91grht4F989tpqEtdQwCe3I33XDQqCRJQfc
 UKIc2dv81Da60VD6gOzplGSZBX5DAGLv6WPZ6tIAWLuT6fOdsXO3DzaeIj7MGT4ExXmu
 nbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771347940; x=1771952740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
 b=YMHRsyfdCaHaXk+LUieuI40qwCLv29E1CibLXxy1qx1IdxGDt/MUjXyf4cyc0sL4kF
 s4zqUjbTRnYZG3cFfmk/an6U4HOQXSlFgoLAsJwSDuO+I/L3lkjOhKaIG/Ar/d2RiMcH
 xz1ni8FCgl99MUjbYafCGfBPY7bt20ekltIP6SeILbWHQkd5c8tDCsaSBcCjZJLeTMmj
 OVKLOX/UKTqEnFTv/apw1wjXtJjG/2wOXTGusIMgSZouFH4q444hbB4rs9mAuTgWHuua
 bK/Sv/zN5NWHorO9uXHeZoPXxRM2E4kFLa0WBqAQD2xOSyRcNAKI1E2TW+yFN9/Qeq/P
 pKaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAjBEgpNk4P9OIULWkB0Hbp7Q4sQgNrAtFmQMnR20ZHxXvS/K7mkINMgkCH+xXlVnydCpiREqh6C4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoEDc3hPkQO6pnS0N2Gm1xyvV8U/QMXTquxWAP8OB0ye96V6w5
 0q27GIdQt142osktoKuG5SeobMzYUbr444Lfs3u2P65okcvbUU79cPfXLhTWHg+1QJmzSCDbKjL
 k73UNMW/RgBvGxGcN9E5ChJ+dZSFkKT4=
X-Gm-Gg: AZuq6aIbYhc1X2kCHGOdrd3LJEPhgM1Pq5Rzca3bPej887MQtPWUm5h7E0qO99wn63T
 qKJFe4ajBPUf04QnviqYFUuwmFtMtL+t5I9dQJwzxGp+n1oF8+0ZPMh0B/cb9fhfBqIq7xB8wRQ
 6kaV7yunEIml/Ldy+fFNVSwDbMtdzJ8ose6xyymgGtNAtDjvA/AjBab/TPwNazwTfwb9k2TYi5E
 5QoPhuXznCh1TdjAvpKfN+anHz3xd7W2Cl04VJ6+xPh06wz/HW4NTqZKypRWrRruDVTOkPsV6s3
 fPXS+Q==
X-Received: by 2002:a05:6402:3588:b0:659:3fca:24d0 with SMTP id
 4fb4d7f45d1cf-65bc7a8ae2dmr5047427a12.29.1771347939988; Tue, 17 Feb 2026
 09:05:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217-stereotyped-dazzling-loon-f06e18@quoll>
 <04a3d18b-80cc-4d1d-8657-cb35c4b5b797@collabora.com>
In-Reply-To: <04a3d18b-80cc-4d1d-8657-cb35c4b5b797@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Feb 2026 18:05:28 +0100
X-Gm-Features: AaiRm53iuI7SH76CEM094B1BEHtAFaoag8i5brp7UnlMPcM5xtOtDulZoBRUZlM
Message-ID: <CAORyz2+MgywrE0v+_UYt8gewq_eZ=ZgTUR66tL8aBbBQU53sDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:angelogioacchino.delregno@collabora.com,m:krzk@kernel.org,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,pengutronix.de,gmail.com,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,baylibre.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9CA7A14E82A
X-Rspamd-Action: no action

Thank you all for your feedback! As I just learnt about the
merge-window patch-freeze
period I'll wait until next Monday before submitting v3 including the
suggested changes.

Mmmh. Now I'm wondering if I should have added a Fixes tag to [1],
that's actually an
user-visible issue...

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20260209090516.14369-1-l.scorcia@gmail.com/

Il giorno mar 17 feb 2026 alle ore 10:03 AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> ha scritto:
>
> Il 17/02/26 08:58, Krzysztof Kozlowski ha scritto:
> > On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> >> Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> >> describe it as compatible with mt2701 instead. It is safe to do so because:
> >
> > You are not doing what you wrote. The dedicated mediatek,mt8167-dsi is
> > still there.
>  >
> > And if you want to describe mediatek,mt8167-dsi with OTHER
> > compatible (mt2701), it is a NAK. It is wrong and not allowed by writing
> > bindings doc.
>
> Sorry, that was my apparently very-bad advice - and I recognize that, as a
> maintainer, I should have given different advices.
>
> Still, check below the (bad, and not enough) reasons why I said that....
>
> >
> > You just added fallback, didn't you?
> >
> > Please wrap commit message according to Linux coding style / submission
> > process (neither too early nor over the limit):
> > https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> >
> > Please run scripts/checkpatch.pl on the patches and fix reported
> > warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> > patches and (probably) fix more warnings. Some warnings can be ignored,
> > especially from --strict run, but the code here looks like it needs a
> > fix. Feel free to get in touch if the warning is not clear.
> >
> >>
> >> - Bootloader doesn't rely on this single compatible; and
> >
> > Does not matter. You still CANNOT remove a compatible. If bootloader
> > starts to rely on this single compatible, you add it back? No.
> >
>
> The issue here is that "mediatek,mt8167-dsi" was never used anywhere, and that
> alone makes zero sense as it is - by hardware - identical to mt2701.
>
> That, leaving alone the fact that nothing anywhere can make use of a node with
> just `compatible = "mediatek,mt8167-dsi"`.
>
> If it is not acceptable to remove something that was never used and should've never
> been there "alone" without fallbacks, it's ok. I'm sure that avoiding to delete the
> one line is not a big deal there.
> Also remember that we are talking about an old SoC that will never see a bootchain
> overhaul, nor will it see new bootloaders.
>
> Though, just a small note - please please please: when we see new contributors,
> especially when they're community ones, can we try and encourage them to do the
> right things, and follow the right processes, without being harsh in any way?
>
> And P.S.: Yeah I know you haven't been as harsh as you can (rightfully) be, so
> thanks for that.
>
> Luca, I'm sorry again, at this point - it would be great if you could please send
> a v3 without the removal of that line. Just add the fallback and that's it :-)
>
> >> - There was never any upstreamed devicetree using this single compatible; and
> >> - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> >>
> >> Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")
> >>
> >
> > There is never a blank line between tags.
>
> Yeah, agreed.
>
> Cheers,
> Angelo
>
> >
> >> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> >> ---
> >>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > Best regards,
> > Krzysztof
> >
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
