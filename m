Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONtJFqSAh2lQYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D115E106CEA
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCAC10E29B;
	Sat,  7 Feb 2026 18:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mXLvoL6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D203E10E8B4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 18:55:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso11456815e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 10:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770404107; x=1771008907; darn=lists.freedesktop.org;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=IYA5f+pziUiONlslby8EJFpkAX1gO6llOpk96yLwpKw=;
 b=mXLvoL6AJKnTxGLED/O3O0+7th5dmGqzjy0ZM77yg1lcMBmkSv7YBIToR0t3fbc386
 HFrUP9Qui4+zAldfFhmtY5YezQIZSudZRGpIDgeVevMbj4qhpP3B1Sq6AAMd/VC1zPUw
 G2tGUeVER26zafRmJSH+vS9eUmi845hi2ZQa62KjGg8RRqC15ETmrqXcYXUaoHU+lKh/
 IL5clm3OjEQam8SNZqVmkONAcouWLdUgEAUzI9IhJ23bPoCkyUEcSM/aElOXWBk+5oyC
 NZ8wkub2/jHgERlv8rRXSOlFi100jKjyxzbyxIQ8K/kfgkX6w9RY8ru5WjDVODR/xvC7
 FeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770404107; x=1771008907;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IYA5f+pziUiONlslby8EJFpkAX1gO6llOpk96yLwpKw=;
 b=WfFH/FaMqar6sPtM2Vkwxez3Hdold8OOD7Zn19fek5i5mE5jM6zb2pMtHsZOr2z8i8
 OnrZtXng4c2BN4A/qWqYQXSJPRWAt6NMwuSZjUfx6Fl5TA5W8XfdH1iaInktTLfWJQnZ
 8KLYm/3Yezf9npjGsPQ28RzxsaaXRE9h2A+ds1l06ywvnmTG2ODtknpF9Iw/Dks01I0d
 Zb+tffXZuRKmoDQmRiKpFAGUKqnfgrSce+PBrrzojJ/Qsioa119BB59sy0X12I4fir8i
 avj+wmJy40bI4cb2XbelGM0Pwa4wFZDTR1pihQYhWnofsLlTczhy8PdYZ07H47Gh9LmE
 GoeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKWIiBcdZtrvUpNJ2DOgfzb/UFpRNaPC8texbjU9//6kzEhtdL/ObD+rTW+p505gUh7bc4ZSGM8VM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT4li7TUfqul+ujTzNLdRw3LG1K+UJ4dqyC0ABMgDZvdW1ncNm
 3UtEbanLS33uMAY9RWPKcKsPrj2LpvEV8lqtc3WPU5wEma4gEQ1VARMG
X-Gm-Gg: AZuq6aKwvUGcK2wNl8MiUr0LcqFJLcBTc83GPbvEOwgJ7meXCSEH2aKigeqOfZubKKG
 OpldWo7uKZJISSQmrEgUHG6TEc4DIoY5XI7hzU7P6f7P4l0ORmFZncp/Q4ufZGX7AndSKxH/2YZ
 G2abeJb6i8qTv/dyPgzAifQeLTB42vzIL9Id1I0LS9qcFfASILEdD6qTLiOdzzIpvAip7/CWklc
 4bF7lvGLC+uafVfLUpC+Rovuo4UYpGd9dNNzaIyQ6Jt1BPGDs1RICG1UP1koGAhsWdaEldgfO43
 4SyVnQEtEpYsxwUEEMB6uvpTgUqbzZeL3fdjI8Ilk6thzmvrlccFU6STZsIB/HnjbOYHlLglf8R
 5CL7baaoI3J1wDI4D91arPbfmmMhOSdihdFRNPZWJMwnPklzO4DAjRlKI6fNCHpAHdGkxDHwRRr
 pliTHsNYVb6HDisUNqBQ+J4IyybKD4D5j/R18YQjozVMGcyYVJaw==
X-Received: by 2002:a05:600c:4590:b0:47e:e20e:bbb2 with SMTP id
 5b1f17b1804b1-483201dc5c5mr54617565e9.7.1770404107101; 
 Fri, 06 Feb 2026 10:55:07 -0800 (PST)
Received: from smtpclient.apple ([2a01:cb10:3a0:bf00:5dc6:926:30ec:c0e0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2d43sm7594818f8f.8.2026.02.06.10.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 10:55:06 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Maxime Schmitt <maxime.schmitt91@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Accelerator/GPU top
Date: Fri, 6 Feb 2026 19:54:48 +0100
Message-Id: <0E8D538D-678A-4899-A44C-297A9F520103@gmail.com>
References: <3be1ec57-d078-40f3-8eb6-d25496fb7297@amd.com>
Cc: Vock Natalie <natalie.vock@gmx.de>, Deucher Alex <alexdeucher@gmail.com>,
 list DRI developers Maling <dri-devel@lists.freedesktop.org>,
 Airlie Dave <airlied@gmail.com>, Vetter Simona <simona@ffwll.ch>,
 list amd-gfx <amd-gfx@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>, coelacanth_dream@protonmail.com
In-Reply-To: <3be1ec57-d078-40f3-8eb6-d25496fb7297@amd.com>
To: =?utf-8?Q?K=C3=B6nig_Christian?= <christian.koenig@amd.com>
X-Mailer: iPhone Mail (23C71)
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:alexdeucher@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:David.Francis@amd.com,m:coelacanth_dream@protonmail.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[maximeschmitt91@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmx.de,gmail.com,lists.freedesktop.org,ffwll.ch,amd.com,protonmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[maximeschmitt91@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D115E106CEA
X-Rspamd-Action: no action

Hello,

Indeed it=E2=80=99s not efficient but that=E2=80=99s the only exposed way we=
 have to retrieve the information at this point (for drm drivers exposing me=
trics through fdinfo).
It doesn=E2=80=99t require any extra privileges if one is only interested in=
 the user owned processes (which is most use cases as far as I know).

I think that there was a discussion at some years ago from Intel on the kern=
el mailing list to expose the process list using drm.=20
Maybe having a way to query which processes (and file descriptor) use drm an=
d then only going through the relevant fdinfo files would alleviate most of t=
he inefficiencies (modulo privilege problems for other user processes).

Also I haven=E2=80=99t implemented use cases where the GPU doesn=E2=80=99t u=
se DRM, e.g., AMD CDNA that is going through rocm (I don=E2=80=99t have acce=
ss to a card to test it).
I also noticed some instances, where the driver doesn=E2=80=99t report any u=
sage, although it=E2=80=99s actually using the encode/decode engine through V=
A-API with a DRM handle.

Cheers,
Maxime

> On 6 Feb 2026, at 14:38, Christian K=C3=B6nig <christian.koenig@amd.com> w=
rote:
>=20
> =EF=BB=BFOn 2/5/26 20:25, Natalie Vock wrote:
>>> On 2/5/26 19:58, Alex Deucher wrote:
>>> Has anyone given any thought on how to support something like top for
>>> accelerators or GPUs?
>>=20
>> top for accelerators/GPUs kind of exists already, see [1] or [2].
>> Clearly, this problem has some kind of solution (looking through the code=
, it seems like they check every fd if it has a DRM fdinfo file associated (=
which is indeed not particularly efficient)).
>>=20
>> Maybe it's worth asking the authors of the respective tools for their opi=
nions here?
>=20
> That is a really good point. Adding Maxime Schmitt and Umio Yasuno on CC.
>=20
> Let's hope I've picked the correct mail addresses.
>=20
> Christian.
>=20
>>=20
>> Natalie
>>=20
>> [1] https://github.com/Umio-Yasuno/amdgpu_top
>> [2] https://github.com/Syllo/nvtop
>>> We have fdinfo, but using fdinfo requires extra
>>> privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
>>> way to even discover what processes are using the GPU.  There is the
>>> clients list in debugfs, but that is also admin only.  Tools like ps
>>> and top use /proc/<pid>/stat and statm.  Do you think there would be
>>> an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
>>> This would duplicate much of what is in fdinfo, but would be available
>>> to regular users.
>>>=20
>>> Thanks,
>>>=20
>>> Alex
>>=20
>=20
