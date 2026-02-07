Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BRM+BqGAh2lQYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B7A106CDC
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6575B10E1D6;
	Sat,  7 Feb 2026 18:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205D110E00A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 05:28:57 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-404254ffe8aso1989083fac.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 21:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770442136; x=1771046936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=17OCwG6i1wi5ke5GRpB0Eh3X9L8aGMj6rgAo4LSUjdE=;
 b=sxYOGaU5YImlMDOMlbLGBRUEPJgrHC6Bs/ITvszuaE5qt1Q5A8peWzip4nfkUHz4XJ
 dIj2PI5p2xPXuV5+Zady/Y1QFSJm9a+oQh6s9gV+N+3TceZeiXlc/RrtiXQFnLmC9l3Y
 JqupGcNZv8ZcmxdsZKOb+UBVwGjHi18z8WF2UaBXi5NT0fw1B3YwE+GanymUmHM6YpDu
 Y/gc/5wBD7hEiITNnjGZ5dK/dAYmupeG2ZNvxug7FAJPcK7LOkMBfekO/MQ8i0MMQs2U
 vmfpShkTSQs1qD2uVzm9zvaCok1Tna7WJLhg5IOHynVlQ8l1CML9BGGaYttLUTnPk11v
 fCEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfcCqEEVyqC8IB/n2meJZNngFC71oNo+MWHq/HzRQV/yUxgE3p0giZLPfv9z1i76fQU+rL3wVIS0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPuE0lY3nX86LM6iSBOz1z2+/O1f2XUxtZZpKs+8nsoBQ3EEqW
 1y48wU+E48N1wgsH9W3PZeo/Tx63Jelgg0/5bEwtf1LxP+no7wNFIw99NNEDEg==
X-Gm-Gg: AZuq6aIzJvvNlbOcvNgljTXPIHITQX8UOawQ23DvE/Qo35N0lpuaGeUwh6I6rwvEa0U
 mbdzrCm+aibLPoFjCtrQ0kCzQctJEV1DcIaxhjtlwdCy6XOQWjrBGtFsYo2PInCc+LL9gA7oeq/
 SIPyx0MpOzkajwCQnNHwCNC+Fr/6DX2sanEQYBqSdRlopeZQlNN8AJG8lRB8mycqzodK9Vqb0x2
 rCZnhEPWrHVpWHnevuQHqFisXFN2BnqKNLs4oEJiwdMJ9TiE389t+/MraZUaMIXIdkaHdCH9O2H
 0T/gycMFjZNW9Bx3PHNDdOLKv/905wyzQfG5SnB+rwwOxuXv0PIJFtTbwHmCNXmgI8GvJ59lHP0
 WpKboGDFuQdRHJeJX55W7IHPkEmhmy6tWV+CZTahajVHFM6DBoGeF5s+3uTRxgCgPjCJnv8cSqK
 /lWZzvqktTJoGPpFSPb0Ao9EjbTYi0j2cIVbr7h1j5FA==
X-Received: by 2002:a05:6871:4089:b0:408:7ed6:e0a0 with SMTP id
 586e51a60fabf-40a7542a0a0mr5120569fac.9.1770442136005; 
 Fri, 06 Feb 2026 21:28:56 -0800 (PST)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com.
 [209.85.160.47]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-40a992edd71sm3355144fac.5.2026.02.06.21.28.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 21:28:55 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-404263bd58fso2364190fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 21:28:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7wRFmDGui2jVuABhnlj2bvAHSmc89ogxqUtnJkrvIg7pD1U4fOG8yEoj5JKDjBfyt8tjTZJJyr7o=@lists.freedesktop.org
X-Received: by 2002:a05:690e:1508:b0:649:61b6:8a97 with SMTP id
 956f58d0204a3-649e87e21f8mr6826337d50.42.1770441740068; Fri, 06 Feb 2026
 21:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
 <20260205-winged-alligator-of-sorcery-aada21@quoll>
 <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
 <0bcd3cb0-9231-4cb0-a726-c439d01f63e5@kernel.org>
 <CAEQ9gEnvM1x9zP2RDPpEs3TMZ2Jcah7OU6s0y9zJY-7qFUJJTw@mail.gmail.com>
 <1fee1990-f525-4559-b121-46fd1e1c9fef@kernel.org>
In-Reply-To: <1fee1990-f525-4559-b121-46fd1e1c9fef@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 21:22:08 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=L3gsnyMtbVDbvHo-jhTSPw-8DJ7L2n9c=SKc6jOAHrg@mail.gmail.com>
X-Gm-Features: AZwV_QieKd_ZP4aFD5f_DxifB_sLkcMLB0SwbwiEzLFTZaXP5WcquLwWVuCYe7k
Message-ID: <CAEQ9gE=L3gsnyMtbVDbvHo-jhTSPw-8DJ7L2n9c=SKc6jOAHrg@mail.gmail.com>
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
	NEURAL_HAM(-0.00)[-0.824];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,thundersoft.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 57B7A106CDC
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 2:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/02/2026 10:49, Roger Shimizu wrote:
> > On Thu, Feb 5, 2026 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 05/02/2026 21:31, Roger Shimizu wrote:
> >>> On Thu, Feb 5, 2026 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On Wed, Jan 28, 2026 at 07:15:45PM +0800, Hongyang Zhao wrote:
> >>>>> The LT9611 has two DSI input ports (Port A and Port B). Update the
> >>>>> binding to clearly document the port mapping and allow using Port B
> >>>>> alone when DSI is physically connected to Port B only.
> >>>>>
> >>>>> Changes:
> >>>>> - Clarify port@0 corresponds to DSI Port A input
> >>>>> - Clarify port@1 corresponds to DSI Port B input
> >>>>> - Change port requirement from mandatory port@0 to anyOf port@0/por=
t@1,
> >>>>>   allowing either port to be used independently
> >>>>>
> >>>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> >>>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >>>>
> >>>> Where did this review happen? V1 had this tag, but the patch was
> >>>> completely different, which means you were supposed to drop the tag.
> >>>> Please perform review in public.
> >>>
> >>> FYI. v2 was updated per review feedback, which is public:
> >>> https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@lina=
ro.org/
> >>
> >> Link above is not from Roger, so again - where did the review leading =
to
> >> above tag happen?
> >
> > Per feedback of v1, v2 was quite different than v1.
> > For v2, it's close to initial review, because it looks like a new patch=
.
>
> Where was the review of v2 given?
>
> The patch is entirely different. I already said it. I also said what is
> expected in such case. It is also documented:
>
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/s=
ubmitting-patches.rst#L577

Thanks for the guide!
Yes, v2 was reviewed in private. I'll inform Hongyang to remove the
tag when he sends the next series.

-Roger
