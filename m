Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1309D2144
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D5C10E0CB;
	Tue, 19 Nov 2024 08:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LAlmg6Pw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27F510E1A6;
 Tue, 19 Nov 2024 01:44:13 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2124ccf03edso2878025ad.2; 
 Mon, 18 Nov 2024 17:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731980653; x=1732585453; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TLGZPhgwiSdTuoKO9EIOhX+7x+wgHfPfCEdlENWql4=;
 b=LAlmg6Pw9Zw7WFVOhsgL7Wd9xWvSXE2EI+mkFH/g0O2PukIdTan7wehcCuvdVfbQ3V
 Em6rwq6fdQHEbo3qVvPtrydWlfHJbG+OgvQUVs7MwfChvr2kAZzXOIgBQ1fjV6ICJi5y
 OLutoCMw5xc4UtJWbgzVd8A7CED8FtasualoIwBd6+hlBtvDdQlWf9S0e1GktEe8z+wN
 vt8qX48A2Zs2LjtkGA1s283d0yzBGGwgAAAxr1mkksmW0IhvwjwwEIixecJJEI/yYkX/
 H7MVABC4wA6zp9ZK3SLZSZ5xG63vTcJHz/rrr6N6aT+HZj+gfXGabXDnS02/muzQkNh9
 LqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731980653; x=1732585453;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6TLGZPhgwiSdTuoKO9EIOhX+7x+wgHfPfCEdlENWql4=;
 b=cv3t8XbU6ksCD7v2kSSBUWFizJVmeGj6cnTUxFv4yXDTk25ewfa3UQoEnNBD0DrADx
 S0RzC8CRLu2z2EBxZED34d+uaiP1056zeEmGcQ8fcclKZn4Xd8g03D45By2q8qdDBpsj
 e/7+SWoaKvm++tAyn+ZNxm2++Ulii71DueEGu4mvSjzZPwkFHMo1j3/Ss8Dk7YwOfmPR
 8A4/hoHbs72TA3HOj4rqMQQF5UGDFPN2QOLAnVEiEuiswgynNvYF9JT6800aB7WU+eaK
 d86z/+qTfGo0Xmogs6THMJ4pijkLKqhVxtUwld4OeJXMr43/FH/lP1XbNsfFwpqVT3iX
 hY/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQau0f3CxDsU+FwMplOz9u32wkiiFjWDdop7i4hwbn+9fylugJYcS2wkiFDaoRonS29K/6S/E3jho=@lists.freedesktop.org,
 AJvYcCV6RBN6bZ0OfWs7Ml3kT8Cgoz7EtIl/yizCtVShW6mfhDn4laMsYdImU80nZVQS9uJ8m56BEXg4p/M=@lists.freedesktop.org,
 AJvYcCXEhUKTD8FDsVu7NyNeAnKgSzyYsvJmiuNDjcVj9s6rNiUc2z94Uy0V08R5GZELGAiPqpHPNTaXWA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6SJdtQ/uGsxApjKe50O0zuOAhl2gSh6Ekh1uN5uyRpi40UOPp
 Ur7UubkG6PAMTokLFoD+4dHKJRKr2lSGQjPDAffasctNpgrC2Ar0
X-Google-Smtp-Source: AGHT+IGKOuuVyAvdbfIttKIxJSv7PNCbNBMgaHYEIodVhJO4YNPmnFai9XI15Qs6QZqqMPXdK5RTjA==
X-Received: by 2002:a17:903:186:b0:212:46c2:632e with SMTP id
 d9443c01a7336-21246c26707mr25423135ad.15.1731980653295; 
 Mon, 18 Nov 2024 17:44:13 -0800 (PST)
Received: from smtpclient.apple ([198.11.178.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211d0f6182bsm62977715ad.277.2024.11.18.17.43.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2024 17:44:12 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
From: zhang warden <zhangwarden@gmail.com>
In-Reply-To: <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
Date: Tue, 19 Nov 2024 09:43:32 +0800
Cc: Petr Mladek <pmladek@suse.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <99755FD2-270C-4122-8A22-6C73A81028F6@gmail.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
 <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
 <Zzsfuuv3AVomkMxn@pathway.suse.cz>
 <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Mailman-Approved-At: Tue, 19 Nov 2024 08:09:25 +0000
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



> On Nov 19, 2024, at 02:18, Easwar Hariharan =
<eahariha@linux.microsoft.com> wrote:
>=20
> On 11/18/2024 3:06 AM, Petr Mladek wrote:
>> On Sat 2024-11-16 11:10:52, Christophe Leroy wrote:
>>>=20
>>>=20
>>> Le 15/11/2024 =C3=A0 22:26, Easwar Hariharan a =C3=A9crit :
>>>> [Vous ne recevez pas souvent de courriers de =
eahariha@linux.microsoft.com. D=C3=A9couvrez pourquoi ceci est important =
=C3=A0 https://aka.ms/LearnAboutSenderIdentification ]
>>>>=20
>>>> Changes made with the following Coccinelle rules:
>>>>=20
>>>> @@ constant C; @@
>>>>=20
>>>> - msecs_to_jiffies(C * 1000)
>>>> + secs_to_jiffies(C)
>>>>=20
>>>> @@ constant C; @@
>>>>=20
>>>> - msecs_to_jiffies(C * MSEC_PER_SEC)
>>>> + secs_to_jiffies(C)
>>>>=20
>>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>>> ---
>>>>  samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
>>>>  samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
>>>>  samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
>>>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>>>=20
>>>> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c =
b/samples/livepatch/livepatch-callbacks-busymod.c
>>>> index =
378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993b=
adcc9aba 100644
>>>> --- a/samples/livepatch/livepatch-callbacks-busymod.c
>>>> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
>>>> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>>>>  {
>>>>         pr_info("%s\n", __func__);
>>>>         schedule_delayed_work(&work,
>>>> -               msecs_to_jiffies(1000 * 0));
>>>> +               secs_to_jiffies(0));
>>>=20
>>> Using secs_to_jiffies() is pointless, 0 is universal, should become
>>> schedule_delayed_work(&work, 0);
>>=20
>> Yes, schedule_delayed_work(&work, 0) looks like the right solution.
>>=20
>> Or even better, it seems that the delayed work might get replaced by
>> a normal workqueue work.
>>=20
>> Anyway, I am working on a patchset which would remove this sample
>> module. There is no need to put much effort into the clean up
>> of this particular module. Do whatever is easiest for you.
>>=20
>> Best Regards,
>> Petr
>=20
> If we're removing the module, I'll drop it from the series. Just to
> clarify, do you mean to remove all of samples/livepatch/* or some
> particular file(s)?
>=20
> Thanks,
> Easwar
>=20

Hi Easwar!

I think Petr is going to remove just this module away. Anyway, I don't =
think
removing all of them is a good idea.

Thanks.
Wardenjohn.=20

