Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMvrM6KAh2lQYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA0106CE3
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7761310E297;
	Sat,  7 Feb 2026 18:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFEC10E0FA
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 10:35:19 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-64937edbc9eso1459721d50.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 02:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770460518; x=1771065318;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R7Y2cu7AzslvSBJEnBtJDOTsvONwUvJjzxIqlE7f53s=;
 b=S4I0/vo9d8yLW7hyiieUzIpxzuRmGe1OTd5CGnF7viHRs3oVOwq1sra/zfa+2Z43to
 J509NtKFC7Zkx6CJ8S86dQqHQm2ZsFXjWkv/l5agsiUhNEnNDWZqWPnY6DZNVwtvlvZy
 r8ou50sHOHQG2IaEXQwrI1UENvC5Tw9PHEQ/8OlCiU/q9sbJRna2Fvwl0gsG7XOPo7Tl
 WxXOhzNwT6pa9ApnVSXZSfWuasfLwxpf43DuWmsuzdLV/HpuQwgfGKhhYPoHERUIs1AM
 1zPk7ydwpiapAFM7zB5YMao3qPjxboqTMUqo5JCkRdkiynv7KOhFjrl31/i9DqQaiHOQ
 LoAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkUNjHEbbT+el9QARBDNIRnehi9lVe1nviSCJK9eoMJPQdQJhpyd23F1aA2iBNAFpIGr1uhj5/YPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzLHzteuYpv3lfFo7lGnfiXduaDGHuAXkNi+lVvNys8ApivSk+
 HxC14LXN2renbtySPNUq9kCaQwurzLY/mvrt7yCZvSuJl2WwBTENov4oMDNfVA==
X-Gm-Gg: AZuq6aLKeYaE2O+XuWxuja0MdJvFfgx675KPxSI2p2z5LFoPXoGC9VB/+Vhm+CcSWUv
 mVc0VojjZDjJsozIJH6SjNhwgQ/wXirjE9I7orZ2dTDgpW7zNdJNqHR/flGSrt2w4V4Gz1crAPC
 ijC+TTJDePlXZ2GVj7CdAN3flWl/ZH5tt+AXCfC+LncQXOtKDYE84XuYXvrv4ly9FiaGrJC0oy+
 DjqreereTixgU3ehvM/mP82ZSRN+n5PYgRkp0GU6TJWPCaJL7/64cYiAEI3Yab8e9exgMVO2FaH
 tZzKrtKr9AvB6F62b/bhKXk7CQPg9+FBrCLuxOM4obJ6AxGoW80SfGzHjOxW7qssTgg2GyJFo2S
 XXv0B1g/R/OhNtA8tBa3qQIDA5TFa7ME5twXN7TZyFQDRRDMD0VStJEKfjQdaDhDoM6gjVwTY6Z
 BvGkqrgu1rGWhEHae8u84VEqPHkRKo96TDOst3AU/9+w==
X-Received: by 2002:a05:690e:4085:b0:64a:db1d:2d57 with SMTP id
 956f58d0204a3-64adb1d310bmr160701d50.2.1770460518487; 
 Sat, 07 Feb 2026 02:35:18 -0800 (PST)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com.
 [74.125.224.50]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-649f256f97asm4739441d50.22.2026.02.07.02.35.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Feb 2026 02:35:18 -0800 (PST)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-649d4690174so1396274d50.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 02:35:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYesLgent6LDGr6/OC/PZbD69tlVIgTryAEvVyRxPYZN/Okp88JYgFWA7WUcX7moBM0iawpJoyuSM=@lists.freedesktop.org
X-Received: by 2002:a05:690e:e8b:b0:649:e94d:ea2f with SMTP id
 956f58d0204a3-649f1eb0c01mr4470518d50.39.1770460517932; Sat, 07 Feb 2026
 02:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
 <20260205-winged-alligator-of-sorcery-aada21@quoll>
 <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
 <0bcd3cb0-9231-4cb0-a726-c439d01f63e5@kernel.org>
 <CAEQ9gEnvM1x9zP2RDPpEs3TMZ2Jcah7OU6s0y9zJY-7qFUJJTw@mail.gmail.com>
 <1fee1990-f525-4559-b121-46fd1e1c9fef@kernel.org>
 <CAEQ9gE=L3gsnyMtbVDbvHo-jhTSPw-8DJ7L2n9c=SKc6jOAHrg@mail.gmail.com>
 <f1e0d724-4d71-4003-b690-9bbab3a01cd0@kernel.org>
In-Reply-To: <f1e0d724-4d71-4003-b690-9bbab3a01cd0@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Sat, 7 Feb 2026 02:35:06 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEkEiNS83b4ptogzXZH8FsoUWHSZ8NabNHMRjJ0LegxXig@mail.gmail.com>
X-Gm-Features: AZwV_QiOhcyuj2SxtwX--Sp5p_XHyxG-dX_Ewq7SdNxOcGflxqe5mw5T5S_JqvM
Message-ID: <CAEQ9gEkEiNS83b4ptogzXZH8FsoUWHSZ8NabNHMRjJ0LegxXig@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: lt9611: Support single Port
 B input
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 07 Feb 2026 18:12:44 +0000
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jernejskrabec@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	DMARC_NA(0.00)[debian.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.823];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,thundersoft.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 64CA0106CE3
X-Rspamd-Action: no action

On Sat, Feb 7, 2026 at 1:35=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/02/2026 06:22, Roger Shimizu wrote:
> > On Fri, Feb 6, 2026 at 2:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 06/02/2026 10:49, Roger Shimizu wrote:
> >>> On Thu, Feb 5, 2026 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 05/02/2026 21:31, Roger Shimizu wrote:
> >>>>> On Thu, Feb 5, 2026 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> >>>>>>
> >>>>>> On Wed, Jan 28, 2026 at 07:15:45PM +0800, Hongyang Zhao wrote:
> >>>>>>> The LT9611 has two DSI input ports (Port A and Port B). Update th=
e
> >>>>>>> binding to clearly document the port mapping and allow using Port=
 B
> >>>>>>> alone when DSI is physically connected to Port B only.
> >>>>>>>
> >>>>>>> Changes:
> >>>>>>> - Clarify port@0 corresponds to DSI Port A input
> >>>>>>> - Clarify port@1 corresponds to DSI Port B input
> >>>>>>> - Change port requirement from mandatory port@0 to anyOf port@0/p=
ort@1,
> >>>>>>>   allowing either port to be used independently
> >>>>>>>
> >>>>>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> >>>>>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >>>>>>
> >>>>>> Where did this review happen? V1 had this tag, but the patch was
> >>>>>> completely different, which means you were supposed to drop the ta=
g.
> >>>>>> Please perform review in public.
> >>>>>
> >>>>> FYI. v2 was updated per review feedback, which is public:
> >>>>> https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@li=
naro.org/
> >>>>
> >>>> Link above is not from Roger, so again - where did the review leadin=
g to
> >>>> above tag happen?
> >>>
> >>> Per feedback of v1, v2 was quite different than v1.
> >>> For v2, it's close to initial review, because it looks like a new pat=
ch.
> >>
> >> Where was the review of v2 given?
> >>
> >> The patch is entirely different. I already said it. I also said what i=
s
> >> expected in such case. It is also documented:
> >>
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/proces=
s/submitting-patches.rst#L577
> >
> > Thanks for the guide!
> > Yes, v2 was reviewed in private. I'll inform Hongyang to remove the
> > tag when he sends the next series.
>
> I am repeating myself but only because you really avoid answering.

Because I just didn't have the time to check when exactly it happened.
I agree with you that if it's public, then it's easier to check the
mailing list.

> I understand v1 was reviewed in private, before posting, but why are you
> developing in private also v2? After v1 was posted, this should be all
> done in public.

Hongyang wrote the patch. Credit to him.
I just helped to check.
v2 was a rewrite since feedback of v1, so we think it's like new
patch, which was reviewed in private.

> I have no trust in private reviews happening between versions.
> Especially if v1 is send on 27th Jan and next day v2 is sent supposedly
> reviewed in private. Really?

This patch is not huge amount of work, in spite of rewriting from v1.
I understand that it's not good to resend a series too quickly, but
for this specific case, the feedback was very convincing, so v2 was
sent out without much waiting.
If you insist on some more waiting period, we can follow it next time.

-Roger
