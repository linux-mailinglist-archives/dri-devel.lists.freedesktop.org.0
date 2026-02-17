Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wC7tAGKZlGkoFwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:37:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B214E4D1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF3110E512;
	Tue, 17 Feb 2026 16:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hm97DLmU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A0810E512
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:37:49 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-65a36c8bcabso1624076a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346267; cv=none;
 d=google.com; s=arc-20240605;
 b=Nt30JW7N+6xjb9crXNLl9qbL7qAMVMAwc7jkXgncuzRzOK2Oq9CMxsO3yEPto8Matw
 Hg6lKYrOGXsMf8veTv7YFaRQt5DaDUdoy2w06L9gyw3AJQy+xOXwcM9Qi2WpfLXYYhhy
 ZAkgBMSOHopXm2a8WInEmR6Sq3IOS3StGhDJXPV1qwuXW9VvNz1x2JA31do6QqHiamaz
 aWfv6vq9vKU1WFWibqW23WnvI5FFGTZzGnjrSMFR3GFG5znHllsfDCiI8D0MBmHSQvi6
 WMc81CdJ20XN9ctDhgq5UU+PnY7FOHCYtchEUnDsoAKeBUXHGbgfxhfAszzAfTokgGD+
 GGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
 fh=qxvmJ7XTNQbNwzqJe38WpBby/rRP9yd7ICKyDVeqTM4=;
 b=de757GoSDX5vE0chIB0g9C5+L71okx+JqFjBDkQ3/A91YE1n+SFCLMERGRnAQxYhWm
 QmyTU2fSgnz+IzlSZ4OoMFVYBHJYTlQ9Ji6oKPMZHK2B8mzRp1bLiLhBIGZI2rlwBn+t
 y7Wj3MWcHmdtLLSskZ7inV5ob2w1T+zQ4KFrrrB0QS86Qfb2LwuIftiuGuoxAKEDFQow
 yPRZhtwHzqxxJCXuuEB0f8HVYxyJF7dtHVUBtcBKQc7tTqiKRt3dHccgnM/mcxMThSY2
 vIyZgQ7q+4PqXiGCpQraIbvgO1tvVGlXQTEPa6alGMh30rBNoVTEi8z7cg1wDY7lVlAC
 6Icg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771346267; x=1771951067; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
 b=Hm97DLmU8AooV9DjM11wDCbhW5+FFenQfpp9nEnIuIt1bBaSvUxJLv4/hb3p9w9GtN
 m2128sEzT7oKYm0BRDT3dmlUkHQtAo2yHb6p+cswVoFXp0aCGjIooB0GH5VnXabrKUVY
 nnE2Ve52yEZSaYQHpxih+u8aVmxsmb0iwtK43489XccojY44KV4A8zQdar+0xsXUMe9F
 MZLTdgsvM1dbbdEF8cIo6hCSb4cLTWZmQcXlWs2jPT44vyv8JF0vjhnGWXSczSUQXViO
 M6QVvnqIK8T6+YhCE378JGzgxSc6WSYs2hKV18aCZ6lBtnyZA6cR7VvPDPzfszWCYTRH
 xHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771346267; x=1771951067;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
 b=oXAAhuG/EOUc24kyDfpGe33Xbtn95ZzNWD5ieWzTrVg8CSgdTBuU2D4FSpwU2CqI/C
 XNmqRmNDgzBZ4aOdZEGAeaSND8MWs4V/zYhDjGrPWLC9qUFrtyiW/ECsJTuYwCq2UQUb
 +e/NuVOvxowiN0kwdz3NF5jOAqL+G53YFm1Fu9k9NzhgsC9/Dyxv66UbnaGCLEX7tk3y
 6fs0qluUr4GqMha6JUPXjmBDLf9a4GbT4RNrHslsRw//Liy4eMxWHa48e/463kQqZWw5
 20FW1xkWJ8wEoxLWuk6yZyWpadotZntynSviL52Qv3+s3EN3gIhayQWm/2kSFvONUemw
 lzyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeKZ8K/7GBPO8mDf1X2GkAXpvWXi4Rp28SiYjauUZnWER3NSPM4+u0VTgiJF3H0iTUYjRzr8holbo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjYBrkCdtoPPR+M9KjfV4piHcpIrfTbnwAvYJzHRcu1+qYEUF9
 CvgCt7/8NVJTqlaC0MkItAnW4H26bIY0TgTAZHnrgIrmP/thZFOo+SaqZY1GvhdAIvWVbQNxR+o
 SFHZdrqpWF8iOwR5pHnVYQ2m6cI8EYE4=
X-Gm-Gg: AZuq6aJTAxF8YtHvaxAgTkHXKtJL7zpl0d5BRyrBfQ5ekNMtCa50nAGWYO7nkQWzMQS
 jgkuQA845XivSV41KEzODuMUugmShngYw8oSkWgKJZ1EKdCtjru0tcVSeUOZwspDw9AeyTE74lY
 2cv6b9zhz0Nc3Xoh0Egbav4vFBBxnSDJwOyOErDSHcNiTIAvbFZVvv6FefB1DixdRYGy2MCta2C
 x3HpyCUDhsq6pERr7QUYAOFk4BZIDNE17fRtioPNBAsIMPgp7nPhDvHR5eSRz5bizHcH9lQFOlf
 0CXeH4SFC8t9wyfi
X-Received: by 2002:a05:6402:3648:b0:65c:1f0f:e6f6 with SMTP id
 4fb4d7f45d1cf-65c1f0fee06mr2535558a12.22.1771346267257; Tue, 17 Feb 2026
 08:37:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
In-Reply-To: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Feb 2026 17:37:36 +0100
X-Gm-Features: AaiRm51UVemOzhQMk6xoVI4EJaD4w62lgA3q3kyqzB9n5tt-MdAm1A1cRwc2sAA
Message-ID: <CAORyz2L6_4yLb7t6-H3MjCu7QJtPF0QTvdsvdBw8f9zTey_tBw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: Vladimir Oltean <olteanv@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:olteanv@gmail.com,m:linux-mediatek@lists.infradead.org,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,pengutronix.de,gmail.com,ffwll.ch,linux.intel.com,suse.de,mediatek.com,linaro.org,collabora.com,baylibre.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 648B214E4D1
X-Rspamd-Action: no action

Hello Vladimir,
thank you for the reply and explanation. As a new contributor it is
greatly appreciated.
Those patches are definitely intended for next since as far as
I know there is no mt8167 device using upstream kernels out there.

As for the Fixes tag, the rationale for it was that it's ultimately
not coherent with both its original author's intended usage [1] nor
with the current code as it's not present in [2], possibly due to the
fact that at the time of the original contribution bindings were text
only and less accurate, so I described is as a "Fix". I understand now
that the Fixes tag has a special meaning in the merge process so I
will just remove it in v3, it does not add much information anyway.
Also thanks about the git commit prefix suggestion, I didn't know about it!

I apologize for the confusion and I appreciate all guidance from maintainers.
I really want to do stuff The Right Way, it's just a matter of moving
along the learning curve.

[1] https://lore.kernel.org/linux-mediatek/20210406113631.2675029-3-fparent@baylibre.com/
[2] https://github.com/torvalds/linux/blob/9702969978695d9a699a1f34771580cdbb153b33/drivers/gpu/drm/mediatek/mtk_dsi.c#L13061

Il giorno mar 17 feb 2026 alle ore 16:35 Vladimir Oltean
<olteanv@gmail.com> ha scritto:
>
> Hi Luca,
>
> On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> > Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> > describe it as compatible with mt2701 instead. It is safe to do so because:
> >
> > - Bootloader doesn't rely on this single compatible; and
> > - There was never any upstreamed devicetree using this single compatible; and
> > - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> >
> > Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")
>
> Not sure which direction this patch will go in the next revision, but
> (if this patch remains in this form, and intended as a bug fix) please
> do not mix fixes for the current (and stable) kernel with new development
> for the next kernel in the same series. They are supposed to be applied
> to
> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=next
> and
> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=fixes
> respectively.
>
> (also see Documentation/process/stable-kernel-rules.rst for what is
> generally considered to be a bug fix. We don't use the word "fix" very
> lightly, there needs to be a user-visible impact.)
>
> To help the build test automation select the proper base branch, you can
> use the "phy-next" or "phy-fixes" git subject prefixes when generating
> your patches.
>
> You can send fixes at any time, but please send new development for the
> next kernel only when the merge window isn't open (unless it is marked
> as RFC, then it can also be sent any time).



-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
