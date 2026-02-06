Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHHpOEAohmmSKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C056101455
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E8910E872;
	Fri,  6 Feb 2026 17:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF03C10E028
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:49:25 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-794c2db2ee5so19591387b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 01:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770371365; x=1770976165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9PKdkFDBpdEaAPJ8ineUNhYTfLtKuh6xL3hbE89jpuA=;
 b=KGVZe0t+gMxH3Z5HHujAh+IDZlVQ7JY3QTZZxuGNgfkUKHP+bgDo6lQD3H8eLfRt5h
 43osmNBPaBqWIdynM95N1XD+2ts516tHAzqAO6Q/aPkg6Gm2scnKZcRPJOdJL3mS7dZC
 7MrbUHyoFpybD7wQsZ0LqrYaVjXA76NpYj/1EPz9zuJzrPEMSM16Ef/NLV9kt/07vXJA
 mI8o8kl5Iz+wd492PqgP+IFD8dvpc/kWIMqplnDa05rrERBSm6Dwge4zrWztPJLUyvRj
 embqiWkxzxHBtgPz/K4muyGbP5Rr7BiWNuWKmbNOPyyb7LLUPO5DAttRrLoYTkPM3UxE
 8q3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIe9DWBRsA+avpH6PozxCAKEpGE5VKrTFRv0xXys46iN5ekKzrN6o8vm2EwXljMuLJ7JAp1eO9w8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBlSM2lWSFxi/cuKB0kQTEa3pInJaj1Fsr10ssGBfw0Z2EJU6t
 +g981GUDbGTiIetuwqJ02L2qQvVEoZ4RFbvhR0QwLuPv8CioKDTCjZR01xLOxA==
X-Gm-Gg: AZuq6aKoJ7KjzdrT/6pwCxWRzUfuMUGz6ky0zlH7zNUL5petNHJx9bhCXVUVIV2Sz14
 P2QDohzuS23EXgWpHzYJOg6FXrzlrYvBdo+sgKly4ZO7NxPU/mMLb6JvNJrZtY1iOZlMZQdtowM
 F496DWcK2pn75o3yeLqWezkVXF0v/dWv5Uu/Ynh56zNlSSDgLFeF622JLsO3XegxGm4JXC0KO/+
 LzfhwPtXE8U9SeAbytzZ+Sj3SgzGnLV6BOydRcNgokJhpWuG/1magtNYglta6SZoRbCEZDrtMuo
 PXa6XMbjw5Ux5Z98o+ItgOwBHFSC7psxngYh+6ZrSpekGr9dYadW8syFozGUFqluIeAwEeJvywP
 /z3Rt97FHz+6jSFcaLJtOU/5uaxviMJ2tPQqRUuJe8n+guo5VJ+Sz07xDbHk6BfeVjZKifbxxZD
 uf4RXj9wHpO9Nkj6OwU15bniij3cfTB23Y54zql1EOEw==
X-Received: by 2002:a05:690c:92:b0:796:1f31:f556 with SMTP id
 00721157ae682-7961f31f9a8mr7817967b3.45.1770371364747; 
 Fri, 06 Feb 2026 01:49:24 -0800 (PST)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com.
 [74.125.224.46]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7952a1dca99sm16542067b3.35.2026.02.06.01.49.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 01:49:24 -0800 (PST)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-649ba412b8dso1826864d50.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 01:49:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUoI9peSk84j1qfhMYA0lJzWs7Z0QXdgV3zy+e/rcn9EcqJm+iE5otFt0lW6zquReyOVG7xxrkbjO8=@lists.freedesktop.org
X-Received: by 2002:a53:c449:0:b0:649:d604:fb90 with SMTP id
 956f58d0204a3-649f205a43dmr1514153d50.53.1770371364383; Fri, 06 Feb 2026
 01:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
 <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
 <20260205-winged-alligator-of-sorcery-aada21@quoll>
 <CAEQ9gEkkK_qBCq__oSJb1D5J=gLyw-kVDx1OD4SMPry6z-F7nA@mail.gmail.com>
 <0bcd3cb0-9231-4cb0-a726-c439d01f63e5@kernel.org>
In-Reply-To: <0bcd3cb0-9231-4cb0-a726-c439d01f63e5@kernel.org>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 01:49:13 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEnvM1x9zP2RDPpEs3TMZ2Jcah7OU6s0y9zJY-7qFUJJTw@mail.gmail.com>
X-Gm-Features: AZwV_QgaD4XmhDKNBHfx8XaTKWfKOlqUfpjXIlHN1Z6ouM3UQ5-2qulJHJBUYsw
Message-ID: <CAEQ9gEnvM1x9zP2RDPpEs3TMZ2Jcah7OU6s0y9zJY-7qFUJJTw@mail.gmail.com>
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
X-Mailman-Approved-At: Fri, 06 Feb 2026 17:43:15 +0000
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:hongyang.zhao@thundersoft.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jernejskrabec@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[thundersoft.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.888];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,0.0.0.1:email,thundersoft.com:email]
X-Rspamd-Queue-Id: 6C056101455
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 11:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/02/2026 21:31, Roger Shimizu wrote:
> > On Thu, Feb 5, 2026 at 5:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Wed, Jan 28, 2026 at 07:15:45PM +0800, Hongyang Zhao wrote:
> >>> The LT9611 has two DSI input ports (Port A and Port B). Update the
> >>> binding to clearly document the port mapping and allow using Port B
> >>> alone when DSI is physically connected to Port B only.
> >>>
> >>> Changes:
> >>> - Clarify port@0 corresponds to DSI Port A input
> >>> - Clarify port@1 corresponds to DSI Port B input
> >>> - Change port requirement from mandatory port@0 to anyOf port@0/port@=
1,
> >>>   allowing either port to be used independently
> >>>
> >>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> >>> Reviewed-by: Roger Shimizu <rosh@debian.org>
> >>
> >> Where did this review happen? V1 had this tag, but the patch was
> >> completely different, which means you were supposed to drop the tag.
> >> Please perform review in public.
> >
> > FYI. v2 was updated per review feedback, which is public:
> > https://lore.kernel.org/all/7d9041a3-9d2b-469a-9fa7-89d53bbd2a1f@linaro=
.org/
>
> Link above is not from Roger, so again - where did the review leading to
> above tag happen?

Per feedback of v1, v2 was quite different than v1.
For v2, it's close to initial review, because it looks like a new patch.
Of course, if you don't like this way, we can drop this next time.

-Roger
