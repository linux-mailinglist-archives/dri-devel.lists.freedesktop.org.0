Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22B69A052C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A58310E6C5;
	Wed, 16 Oct 2024 09:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DX5KkB/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E1F10E6C5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729070108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnfLvsKAnPHsfWhvxGzrQ3S5UIfGQZhqrAJ3O/9O6sc=;
 b=DX5KkB/sKQs+srJhV471UrYclqnLh/GtoDQchvLi2BcxqY4uh3CvtKJh6UsYPhBUPMy3y6
 K5FJtBZsP9NFEhHWKcZ6imPpc9nQf8Y+Oc8zEjYYX9qBOEQD5O8SHw44GD3EWvmgPW5HFl
 YI6fJvM4bZ5+WtGwlby9fDc6RQjaemU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-C92IkVapN8Kvw1lyCN9dyw-1; Wed, 16 Oct 2024 05:15:06 -0400
X-MC-Unique: C92IkVapN8Kvw1lyCN9dyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43124676f8aso28063965e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 02:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729070105; x=1729674905;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hnfLvsKAnPHsfWhvxGzrQ3S5UIfGQZhqrAJ3O/9O6sc=;
 b=IxWWe/CbeVRUXFkKoKYBlJnou3PBVW8kOKQKNqzdfD7JCEH1UGz1ZrEfprm0kMyIc1
 VCTZN1tJqlIUNBoXGw4F1Pokkvysv824MZmNEjGuzjy/Co59xbOfrKa+tD/9GqMypwQ+
 VLVDuHU22nmNcOmojndEaNjVm8HA/mwOvcuXliUDgWoFIjvRU2H21qjrqiiGsB6vnUzy
 7NSijOzGfARB64G44/XEt8lZkXEFujmQQlBvBkYUNaW+daH26xyqiYrj3CCT47jwM+oI
 u1iwk50Hv18AGLujrEwBUwEk64JQr67WCjYMa6mHAhGbgopRBpLkEANQBZafgp4aTMsk
 /FoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn3YN2jwQdARPXQeAbJlGPHdEgZKBOFs/Jl1RM2tsblfPzKzyJ7MwDbp9mtjmiPh3u1E7YS7ZBryM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhzAdxZ3rc4YQ/g+WtcriGRH3PPF2jRgymzXQ/yZyz2bYtmOW9
 wJjw7ZVEN0PYIvMpo0oph9cx0e2NThx1dl617KbfKcnL5qRbpKc/w9uhW/kdZZEk3RXTnKxIo88
 9uYD+B9fCQQSsBHRZ29zolpc6uNJvhs/lnq6tQJBBPKLEAVXCrTg8CKbHvUQkPLRRxw==
X-Received: by 2002:adf:ce83:0:b0:37d:480f:9a6c with SMTP id
 ffacd0b85a97d-37d86c02a75mr2089860f8f.25.1729070105382; 
 Wed, 16 Oct 2024 02:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR8e0277wToetqm3Vc6BuZc9Q3SAoHElcdg8aqzyr3VDQiVfFANF3I4L1HWwsWy2Mv5NmsWA==
X-Received: by 2002:adf:ce83:0:b0:37d:480f:9a6c with SMTP id
 ffacd0b85a97d-37d86c02a75mr2089844f8f.25.1729070105039; 
 Wed, 16 Oct 2024 02:15:05 -0700 (PDT)
Received: from dhcp-64-113.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa7a1e0sm3850036f8f.9.2024.10.16.02.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:15:04 -0700 (PDT)
Message-ID: <37d9da67a2e60af3fcadbbc53fc64771923ebd95.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/sched: Optimise drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Tvrtko Ursulin
 <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Luben
 Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Date: Wed, 16 Oct 2024 11:15:03 +0200
In-Reply-To: <8816667f-a272-4ef9-87f0-880c47476a9f@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-2-tursulin@igalia.com>
 <0df6b855b0974a88a3f6af42108e2596bd285898.camel@redhat.com>
 <8c038f91-716c-4a3d-8c70-10859d28d77f@igalia.com>
 <587ac0260e9c843ccd0e7d449fc6b6c9270ec741.camel@redhat.com>
 <a3cb9eba-a13e-4f56-8e81-7a06eb655e3b@igalia.com>
 <33ebe52c5df76611451685261f046d77efc44134.camel@redhat.com>
 <18e9dd02-2cdd-42a2-9e7f-271c685d9f93@igalia.com>
 <9b9378581aa75fc39117a03a573199920c832b31.camel@redhat.com>
 <8816667f-a272-4ef9-87f0-880c47476a9f@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 2024-10-16 at 08:41 +0100, Tvrtko Ursulin wrote:
>=20
> On 15/10/2024 15:00, Philipp Stanner wrote:
> > > [...]
> > > How about this:
> > >=20
> > > """
> > > In FIFO mode (which is the default), both
> > > drm_sched_entity_push_job()
> > > and drm_sched_rq_update_fifo(), where the latter calls the
> > > former,
> > > are
> > > currently taking and releasing the same entity->rq_lock.
> > >=20
> > > We can avoid that design inelegance, and also have a miniscule
> > > efficiency improvement on the idle submit path, by introducing a
> > > new
> > > drm_sched_rq_update_fifo_locked() helper and pulling up the lock
> > > taking
> > > to its callers.
> > > """
> >=20
> > That looks good to me
>=20
> Cool. So this for 1/5, your text and some tweaks for 4/5, anything
> else=20
> or I can respin with that?

Just went through all of them and looks good to me, I think we can go
with that.

Note that below your signature in the latest answer to patch 4 I
mentioned a second position where the old name was forgotten; was not
sure if you saw that.

Regards,
P.



>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > P.
> >=20
> >=20
> > >=20
> > > > (Let me read through the other patches briefly. Then we should
> > > > be
> > > > good
> > > > with v2 of this series.. or would it be v3 then?)
> > >=20
> > > Depends how you count. By unique series titles or by fundamental
> > > content.
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> >=20
>=20

