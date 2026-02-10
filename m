Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPZhG5yPi2nYWAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 21:05:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCA811EE2F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 21:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC4510E095;
	Tue, 10 Feb 2026 20:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JPfg4h+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FAF10E092
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 20:05:42 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6581234d208so7781116a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 12:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770753941; cv=none;
 d=google.com; s=arc-20240605;
 b=lIYLEzl4U7+fIMSwJtm83JH9yr9WVfWfoc6GCDqewc7WAY8njflF+w5k7A0+Exn83B
 /yiQzE7JxIBNEmbxHbZOlL45Joo8DGwqHuyqgOR4gG+vYOyuWzyqBgnd0kMj9BBwnwU/
 vQLChGWBy0/zAfoaru1dMRSlLG1nGpLS2yGpOD/80RK5mTZBz+Mwz4Bflje+mRBnK6It
 e3f6ueiPUSiuCyQISHP7J63FtlFQTjh0a/n1g0ydG7nfph395OL03JQt8EEUn1XA7A1R
 QpQr5pDkv+0VoI/0oYWhYmJtUNUH9oFQeLQ0DAXc8FUxlEbEQmQLBewHZWDDG4vD2cDM
 BrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
 fh=zKdUTshCndYzQAi8bPieMmW21RwyM+ULWzMLvyYihzY=;
 b=f0CglTwIXlVZ2+TqnlwIsnGa5VYPm0aLG2BrTado8TDPpdgcMvKsuJuyWuRH6NJI0Y
 XIf/WGuFV/8OakNmbY4GybS1ZPAnwuHUULjngw0HhdiMRxmvztVOnsTQxj2aGDuFZfMl
 s1JlNhSzCegVzzTlAcBt+MOILdJy5PLtPSX6bDPCst6LQ4VVQbzH7PSTsS/nrRvpdqfg
 kvwtb/+qzLlVwu9+Jt7rsHeyD8fFvI55E6VHc0XVlzRPviKnZWlyCjtMljm67L8vs7q5
 E60SW9n5FF/4lTbMd0hdtluhMSQTxO1ts0Z7p3q3gdf2oIXrzi6tOcGBKfsH+W1BM2kp
 N5uw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770753941; x=1771358741;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
 b=JPfg4h+56CELFPUoVLzRA8six6zLqUlXzlG/Tv2DJXJr+gB7+e9dcLOqrU8KdJACUK
 3VE7Kp2wN22jz3dJ42yZKnuRbRrpqPpvowgZtFOZFoAu/PcjenLP80NtdMgWoMbYwwde
 eAEbiU6NTqSEyC/E+9coAnk3IR4jCyAOnWEpw8S9kt+kHnELH+LZMAfeocK5gpy+NlAy
 iV32I3+tg1d8vs0Inl5jXQobS9arX4ofJ7fIyAUSsKYu/VIbYQ/3SFBd+qLQiGeXLRYd
 8XAljvkiwhBnk3ureG90QgzfVuf6sMOpFCkdGmEQFH1XcUpt/9k6+2BvRCzQrjdXPqpN
 NhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770753941; x=1771358741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EUYV2jK4EVNH8IU6ztF+fhRopz1DxZCdX+to/Ge4VzA=;
 b=O0TqLERIzIJpiiiGp9DPReKrGBwMVRgL5csJQkHAf86XwIc2k+LO9gE8HVeGCHjiGP
 0DuClgJcGNg6uyh2njcvkBCtlzBcWj3B5P6K8aJhxwB8HGD4iSkr5Dv7vuxl0M85fLOz
 sVbEIbYgzQVKkGFM7sGXl1exqsOxx7kPr2B3V+GiDl9ebYRMqq2ZHpB1pMli5/RBlMNm
 rzuNDWYCe8TieFZnLz+hfrIlj84SjYjqGlLXCbSSAlxQY1vyw4i03G0BuI1+vOq7hhBC
 x1m+CkFBDQ/+ntKENo1RxES8ZRMD5QDYxRK8b2i5013aeu9nwHcYpSe9ojpiWrPHXd8y
 fp4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfFDYfQNWgToGXes4wZR8AqaOlPi0g2P4N+HPPMKVPEhfOZzZFmN5qVVeohLirSHC4tEx7uD0bSi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK+nULAzIc/Ylsx2xJqXOMKy6Z1sXKgKErIFtNjTtSrikoupTW
 CHaCslOdr/rY/KBvLeNM4ptrI1ssaMCKhXacdHOJE96UyCTnyRaTXPOqo8VGTiuZsxPZbU7phsP
 AAYP6w1rnNLL+CmO/+pY0bSPnQbxFmG2iFG9F7oU=
X-Gm-Gg: AZuq6aJOlfi950vak5WEHqr+G1oahUXQJeAiZEdGShqvUhnLxi7yyUaLUxURBjidTjc
 Xn7Xmn6VDEA2Ygm9zDcuVKyHysIdEnSZKV6WXs0XNDp9ftLhIRgLM/mj5MmghnlxnrcFLCOKjWg
 fWu+xx/3C0IebMXqCtyZXtoa7cwic66FoacEf2mCnsA+5Fjf4hLO+zq1iNUSVrvEibypX3RBAxR
 q6dKaFj4kxzC0ihiJc1ICywSZx7SXhJmn9NOBsOKR/NkCUelWYLddzzC9AcUnCg9ttG/YAR+FBM
 ZBF+CwCDEyEDQkj55QwsjKoSGQjO/PhT8i4P
X-Received: by 2002:a17:907:720d:b0:b88:48ba:cd7 with SMTP id
 a640c23a62f3a-b8f6a8e0786mr22320766b.3.1770753940692; Tue, 10 Feb 2026
 12:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq>
 <20260210124819.GC12887@unreal>
In-Reply-To: <20260210124819.GC12887@unreal>
From: John Stultz <jstultz@google.com>
Date: Tue, 10 Feb 2026 12:05:28 -0800
X-Gm-Features: AZwV_Qgy-DNinnCzC9ZTU6U_Twqy09ClMg2rE0gJxLuPqw6IHh5sTKTnvXMZwaA
Message-ID: <CANDhNCoaYoe5Ckin9CnZT2LdQJ2K7amBSUS9GBDzbx_1=U9txw@mail.gmail.com>
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
To: Leon Romanovsky <leon@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
 jgg@ziepe.ca, sean.anderson@linux.dev, ptesarik@suse.com, 
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
 linux-coco@lists.linux.dev
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,resnulli.us:email,nvidia.com:email]
X-Rspamd-Queue-Id: 9DCA811EE2F
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 4:48=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
> On Tue, Feb 10, 2026 at 10:05:14AM +0100, Jiri Pirko wrote:
> > Mon, Feb 09, 2026 at 09:08:03PM +0100, jstultz@google.com wrote:
> > >On Mon, Feb 9, 2026 at 7:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> w=
rote:
> > >>
> > >> From: Jiri Pirko <jiri@nvidia.com>
> > >>
> > >> Currently the flags, which are unused, are validated for all heaps.
> > >> Since the follow-up patch introduces a flag valid for only one of th=
e
> > >> heaps, allow to specify the valid flags per-heap.
> > >
> > >I'm not really in this space anymore, so take my feedback with a grain=
 of salt.
> > >
> > >While the heap allocate flags argument is unused, it was intended to
> > >be used for generic allocation flags that would apply to all or at
> > >least a wide majority of heaps.
> > >
> > >It was definitely not added to allow for per-heap or heap specific
> > >flags (as this patch tries to utilize it). That was the mess we had
> > >with ION driver that we were trying to avoid.
> > >
> > >The intent of dma-buf heaps is to try to abstract all the different
> > >device memory constraints so there only needs to be a [usage] ->
> > >[heap] mapping, and otherwise userland can be generalized so that it
> > >doesn't need to be re-written to work with different devices/memory
> > >types.  Adding heap-specific allocation flags prevents that
> > >generalization.
> > >
> > >So instead of adding heap specific flags, the general advice has been
> > >to add a separate heap name for the flag property.
> >
> > Right, my original idea was to add a separate heap. Then I spotted the
> > flags and seemed like a great fit. Was not aware or the history or
> > original intention. Would be probably good to document it for
> > future generations.
> >
> > So instead of flag, I will add heap named something
> > like "system_cc_decrypted" to implement this.
>
> It is problematic to expose a user=E2=80=91visible API that depends on a =
name.
> Such a design limits our ability to extend the functionality in the
> future, should new use cases arise.

Yes, how userland chooses a heap name is an open problem.

 The difficulty is that userland is the only thing that knows what
devices the buffer will be shared (and this knowledge may be
incomplete if userland passes a buffer between processes) with, so it
has to pick.  But the kernel doesn't give it a way to solve the
constraints of what memory types work with what devices. There have
been some proposals for device sysfs directories to have links to heap
types they support, but that also requires every driver to understand
every heap type. And then you get to the fact that performance is what
folks really want, not compatibility and that may require some system
specific knowledge to decide.

The working solution right now is to have the system provide a  [use]
-> [heap] mapping for a specific system.

I think of this as similar to the vfs and /etc/fstab. So /home/ might
be /dev/sdb1 on one device or dev/sda1 on another.  You need some
system specific configuration.

In Android, this mapping is done by Gralloc, so buffers are requested
for a use and then Gralloc decides which heap to allocated from.

Unfortunately there doesn't seem to be a similar standard convention
elsewhere.  And I'll admit even then the enumeration of uses/pipelines
in some general form is also difficult problem (and is somewhat more
bounded for Android).

thanks
-john
