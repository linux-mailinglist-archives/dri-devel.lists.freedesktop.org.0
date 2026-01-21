Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOFNKgc7cWnKfQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:45:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515E5D87F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BF710E03A;
	Wed, 21 Jan 2026 20:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mpSg0A50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B50F10E853
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:08:33 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-40444c41a70so59250fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 09:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769015312; x=1769620112; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=af5XQHYCmWbE8OkeX4m6uk9+GAFVqnxcLOlrwMZ+INI=;
 b=mpSg0A50nx3gh0oHmeDuoTAgPF2U0/VB4MRU/albJWNUmq0F8/uZHF2+HY4QnwuCYL
 3sFPZ7qPnggRRYXpEyFF459de+93Wy0zn2Ir7TnDSktjeRuYqLSCfPwin5I2tn+r7+E8
 rL8pK9vTtQ4BWFHieg1gGnawSQq8yVjhd99tn2mwTNYd+3QvFsNi9KC2UDl/nVNXgfcf
 tF4VfOLJzyaFSay1nY444AYxopzjiwO/gdAr+b6sNL44RL0z6EBCFvNlf+y9+fE1ZiXZ
 GAuSwVVuW4SK5SFdZBuv1tH3AtoSqyBI46dbG+TPNTt4gWkIectdQn5uu19eOjh/VY+/
 5Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769015312; x=1769620112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=af5XQHYCmWbE8OkeX4m6uk9+GAFVqnxcLOlrwMZ+INI=;
 b=gR4mhCiyG/KE1cmUIzRKQHe0VmGs5MlnU2WjQuQYdScp0gxZuX5U3+QBNl5xt61C/4
 qq50/q9WFbiWxwgLjtftXam9hPPQ1DkzRRuFgQ9b+g4NqoK8ZPTNzhssj8SbSzc6Iye/
 ff9qKdNfqbftqjiZxh07b8AQK44wt4MaRyFtqWdhpxCIs1ogHhtg33eVCkdU3oGL6UkH
 42c6/FOvozlkHFXAwGFp2iMQpzzj1esOxZH4Mic1yib+wo62mzI9MhA9DJHIxFuYJPhl
 Iz0P5YR2Mpiw907Mh0eUSVGJmseFCY1BhAJzmwHgEu24YPrPreYu5tI1YH2oWGStADhv
 aeqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaM18fHsduOJYL9GpHZ2zswXE8k/XRfGDVOQZrWwOPlT5igD8iU9VXco7BsI3mqeKJvgXIT06nqW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3/YbWRuzv2/XLzr7HvFJu9lkXOHdbIFG6nV/P0882ZMxudbXq
 BzqrJswPd2ojdaUXugFKdtson9AEumGEompEAJX19da+vOYa1MEXvgop
X-Gm-Gg: AZuq6aL5uL1Dlhh7bJ69brG6+BPp2pw4dtT2ZatlfoVHkzCAZgb8DrH8KKFbrklUm++
 5YjEc32jNYQl0OYFIeXM+HYlmYcM382xNfBgjsLPygX9UV/KrIO9ugkUizIE0PU0+J8VCf5Dlmq
 e30HpSgRULCMYC9yp1ykWMisfSao8GNefXTBY5oezVcEt33yieFfnGQgrWVGKJ1DEmLQzYB8ZGL
 HIsxymH0G34XA49FjBJ1xSYIZX9plrmisyO2j8eUmrybMKPHGOvXS/WfCzVwqnuQynofeGgufdO
 qEFAxEH64WgqmzNt47XkoNkL1TuyTCQg6yShvj1WFijR+VkHQ4858W15M8S0RsEFVqloAyHacwW
 mh6vgn+z7GwpNc4X9/0YnHP68CRLbZEEKS35IMNorE77LDlPOA31sw5i8eSHqdoU5Ceu+JiQzG3
 +TCk0R4oMnrZFWe5Jlz8RTWoRDeW9S3T37bJXW321ABAw2bo6QZ2xZezA=
X-Received: by 2002:a05:6820:480f:b0:65f:69f7:d0e4 with SMTP id
 006d021491bc7-66117a3d381mr6187186eaf.83.1769015311981; 
 Wed, 21 Jan 2026 09:08:31 -0800 (PST)
Received: from smtpclient.apple ([207.154.79.109])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-661187840d8sm8111739eaf.12.2026.01.21.09.08.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Jan 2026 09:08:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
From: Kurt Kiefer <kekiefer@gmail.com>
In-Reply-To: <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
Date: Wed, 21 Jan 2026 09:08:19 -0800
Cc: Jasper Korten <jja2000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8615742F-EE35-4B37-BA0A-D62FFD5424B4@gmail.com>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
 <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
 <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com>
 <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
 <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-Mailman-Approved-At: Wed, 21 Jan 2026 20:45:54 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jja2000@gmail.com,m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:webgeek1234@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[kekiefer@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kekiefer@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 1515E5D87F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On Dec 8, 2025, at 8:23=E2=80=AFPM, Aaron Kling =
<webgeek1234@gmail.com> wrote:
>=20
> On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten =
<jja2000@gmail.com> wrote:
>>=20
>> Hi all,
>>=20
>> On 11/4/25 19:12, Aaron Kling wrote:
>>> On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding =
<thierry.reding@gmail.com> wrote:
>>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
>>>>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding =
<thierry.reding@gmail.com> wrote:
>>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 =
Relay wrote:
>>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>>>>>=20
>>>>>>> Without the cmu, nvdisplay will display colors that are notably =
darker
>>>>>>> than intended. The vendor bootloader and the downstream display =
driver
>>>>>>> enable the cmu and sets a sRGB table. Loading that table here =
results in
>>>>>>> the intended colors.
>>>>>>>=20
>>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/tegra/dc.h  |  13 +++
>>>>>>>  drivers/gpu/drm/tegra/sor.c | 206 =
++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>  2 files changed, 219 insertions(+)
>>>>>> What does "darker than intended" mean? Who defines the intention? =
How do
>>>>>> we know what the intention is? What this patch ultimately seems =
to be
>>>>>> doing is define sRGB to be the default colorspace. Is that always =
the
>>>>>> right default choice? What if people want to specify a different
>>>>>> colorspace?
>>>>> I reported this issue almost a month ago. See kernel lore [0] and
>>>>> freedesktop issue [1]. The pictures in the latter show what =
nvdisplay
>>>>> looks like right now. It's nigh unusably dark. When booted into
>>>>> Android with a tv launcher that has a black background, as is =
default
>>>>> for LineageOS, it is really hard to read anything. Is it correct =
as a
>>>>> default? Well, cboot hardcodes this, so... presumably? It would be
>>>>> more ideal to expose this and csc to userspace, but I'm not sure =
if
>>>>> drm has a standardized interface for that or if tegra would have =
to
>>>>> make something vendor specific. I think that would be a separate
>>>>> change concept compared to setting this default, though.
>>>> The reason I'm asking is because I don't recall ever seeing =
"broken"
>>>> colors like you do. So I suspect that this may also be related to =
what
>>>> display is connected, or the mode that we're setting.
>> I have tried it on both a MacroSilicon HDMI capture card and an =
Arzopa
>> Z1FC 1080p portable monitor and run into the same darker colors. Both
>> have in common that they use HDMI which seems to line up with what =
Aaron
>> is reporting. I do not have an eDP display to test or another carrier
>> board with a different display out to test.
>>>> It could perhaps
>>>> also be related to what infoframes we're sending and how these are
>>>> supported/interpreted by the attached display.
>>>>=20
>>>> All of that is to say that maybe this looks broken on the =
particular
>>>> setup that you have but may works fine on other setups. Changing =
the
>>>> default may fix your setup and break others.
>>> Do you have a device set up so you can check? Or does the regression
>>> test bench have a display that can be forwarded?
>>>=20
>>> My current setup is a rack of units plugged via hdmi to a kvm which =
is
>>> then plugged to a pikvm. I also observed this issue before I had =
this
>>> setup, plugged directly to a 1080p monitor. I have not checked
>>> displayport. I can cycle through a couple other displays without =
this
>>> patch to see if I get any other result. I am fairly certain I have
>>> consistently seen this issue since I started trying to work with
>>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work =
to
>>> allow for a bisect.
>>>=20
>>> I am in contact with one other person with a tx2 devkit, who
>>> replicated the issue when I asked. Who plans to reply to this thread
>>> with setup info later.
>>=20
>> For reference, I am said person. I have a Jetson TX2 Devkit that uses
>> the P2771 Device Tree. I'm running a Fedora distrokernel with no
>> additional patches applied by myself. I have personally noticed the
>> issue to at least be present on 6.14.5 and 6.17.4.
>>=20
>>=20
>> I'm currently not at home to take screenshots with and without the
>> submitted patch, but will be able to do it tomorrownight or friday.
>=20
> Any further thoughts from the maintainers on this patch? As far as I
> know, this is an issue for all users, at the very least on hdmi.
>=20
> Aaron
>=20

I can confirm that I have the same issue on a DisplayPort output of =
t194.
IMO, this patch will need to be reworked a bit to enable the CMU for =
this
output as well. I hacked this change in for DisplayPort, and then it
functioned as intended there as well.

I've traced back to the reason this is necessary. The DC hub driver is
applying an sRGB degamma for every RGB plane (presumably for blending),
and then nothing reapplies the EOTF later on. Without gamma correction
in places where it is expected, images are going to look "too dark".

Which does raise the point that there is an alternative implementation
where we do not degamma RGB planes in the first place. But this may have
unintended consequences when it comes to composition.

The SOR does not appear to handle YCbCr outputs at this time, so =
enabling
the CMU assuming an sRGB EOTF seems like a reasonable path here, to me.

Kurt=
