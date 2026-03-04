Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF+DCwlZqGlQtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:08:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A18203C7F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E409E10EA4D;
	Wed,  4 Mar 2026 16:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ct9G1qwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF34610EA4D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772640513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XuIJEyuPZseimNyB1dClJ9+gsbn4gJI4NK41evppQNk=;
 b=ct9G1qwyXb6Qu9SaTz9/l9IoD9eMtqV3ykvPYkw3n9QLfiPK4++z3nMw003XneUp+pSNNW
 YxFIZcKdapRxHrOTG+s5a+s+HEj1ZbBprVso7HGRXaxp5PERbyRoVZJ5xHIomHvjwOXqYz
 X+eNHwiPuibk9/sCri/XD97z/9YDTtM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-QEYN65DyMjiuzmAUtklaEQ-1; Wed, 04 Mar 2026 11:08:16 -0500
X-MC-Unique: QEYN65DyMjiuzmAUtklaEQ-1
X-Mimecast-MFC-AGG-ID: QEYN65DyMjiuzmAUtklaEQ_1772640495
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7d4c1b9061eso75349334a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772640486; x=1773245286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XuIJEyuPZseimNyB1dClJ9+gsbn4gJI4NK41evppQNk=;
 b=Y6/r8E3C+Arp3EN49tiDmi0vk+7Kl2iIncZ+Zt84rGLypEav+rsDVs4gBNLc1/6wLE
 FJymAx0NIGBDQlj2T8IMUedtvwUm5mjogLT9sW/NMcLfGW0sNEIK0gCRSuSt4zfzPlrg
 rPJVJYx4zt8EY8EBFjdgUWqH8KxMzC5jMpoPZwgoedEWtz1JMh/vQoNhz7KEEL0SOOIi
 N1wKFqLv4RwAty881e10lq8UqS7OIve0vWScFw2Mluia1K350F+GsHpSnXPTWjlanQOS
 mAefcq1Hph9+Sxrz8ILEjXNdD0mLA8nDBFoVxDQgm3uL5rat0R6A2Z+mRJPP33cqVY0a
 hJYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkPHO5loE62mF85xR8hN+MSEy1NkbZy977SouFagr+LRl4z2mt+v/k7cLmVovHtZo6/hCmbzipObU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+X3xVqpU62lx6WF8XoxTuNXyNxQjzCsCQNi+hLv8XRMpBN+j3
 eeiqZfaQKTUzTW67IYWRxGdIqJcYVRH0oAkdtAd95ajkByGw490nRS9j7ynNwO8jbnk9/WD2Blp
 lSywY14nttxBizh/oW/3Bwt4wQKs4FVh1Ci+fowj5p60EqIGFuv82y8tDtFtSuweplEziEMU62V
 DGvPKkmD6cWVAUXIrSFIhWvNDhNE7/db65R6VnI8UPaNj3
X-Gm-Gg: ATEYQzwHqXz7U0ovJzKFCBRZnTBD2JYNb4jA2205V24SAktgzyQBNeGciSpBcDlgUl6
 F++e27nX0XtCcqTpcVqL1PFuNAreofa/SkuhmFVWQnmYX00yx9pYXO1m3Joixvbc72KQatX/33O
 JoTc7zGOgQiQy9vBfHREnXJkWFXi+hb9BDms7Aw/42aQUASmQyljoBNWcziOOdbTsToOVahKN9T
 w==
X-Received: by 2002:a05:6820:1ca4:b0:679:e68b:f95d with SMTP id
 006d021491bc7-67b1776bde5mr1385796eaf.53.1772640486025; 
 Wed, 04 Mar 2026 08:08:06 -0800 (PST)
X-Received: by 2002:a05:6820:1ca4:b0:679:e68b:f95d with SMTP id
 006d021491bc7-67b1776bde5mr1385781eaf.53.1772640485669; Wed, 04 Mar 2026
 08:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
 <CANDhNCrVVGsxEjgRcVJSn_E9WPUVY_9zpd+t0X_Jy7JqbcHDqA@mail.gmail.com>
In-Reply-To: <CANDhNCrVVGsxEjgRcVJSn_E9WPUVY_9zpd+t0X_Jy7JqbcHDqA@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 4 Mar 2026 17:07:54 +0100
X-Gm-Features: AaiRm51Q5GvpC48eWrWjCC8xCsFxsretWrNgIwHjulMNxRdjdZzE0CFF6Jj-oi0
Message-ID: <CADSE00KqF-7m+ZMYLzzgL3FzZv3P_G-v8ycYdXBj_WE4=P2_jw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] dma-buf: heaps: add coherent reserved-memory heap
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, echanude@redhat.com, mripard@redhat.com, 
 John Stultz <john.stultz@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fFVUrhjSfaY7W4Rd5SPBDhKfDE5iB7-vRbRX3x984RQ_1772640495
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
X-Rspamd-Queue-Id: C3A18203C7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jstultz@google.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:echanude@redhat.com,m:mripard@redhat.com,m:john.stultz@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 9:55=E2=80=AFPM John Stultz <jstultz@google.com> wro=
te:
>
> On Tue, Mar 3, 2026 at 4:34=E2=80=AFAM Albert Esteve <aesteve@redhat.com>=
 wrote:
> >
> > This patch introduces a new heap driver to expose DT non=E2=80=91reusab=
le
> > "shared-dma-pool" coherent regions as dma-buf heaps, so userspace can
> > allocate buffers from each reserved, named region.
>
> Just a nit here: Might be good to provide some higher level context as
> to why this is wanted, and what it enables.
>
> Also, "shared-dma-pool" is also used for CMA regions, so it might be
> unclear initially how this is different from the CMA heap (you do
> mention non-reusable, but that's a prettty subtle detail).

Sure, I will expand this for the next revision and try to clarify the
points you mentioned here (and add these points to the relevant
patch).

BR,
Albert

>
> Might be good to add some of the rationale to the patch adding the
> heap implementation as well so it makes it into the git history.
>
> thanks
> -john
>

