Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCScBZTqp2nelgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:17:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D31FC619
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08AA10E96B;
	Wed,  4 Mar 2026 08:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nqYqX3FO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com
 [74.125.224.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F9910E86A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 17:45:11 +0000 (UTC)
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-64ca1ba0089so5205822d50.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 09:45:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772559910; cv=none;
 d=google.com; s=arc-20240605;
 b=UzF2Oo/xIIjWwFlWeoY1gf1RDwCZle5Qh/+HlADvK0bjBie/4w3WT1ws3T9TEw8zj0
 bq8qb/RXZiv7KhYT/mQ+Zjdl9JLtghhSXKu+I9u9R0QMxia3/yUFYJ+xtGWmYB5wm7Gn
 uMeWgO2wu0cG7lJ1TU8woRyHFrjigIjNbBpISfzmbb053yy5n68l/k6nLwpCJ6jy7kWT
 LEAAUo1sEJGKIj2qbvtzCz0OPAoMivY+w8x52dWccsFWIm8ttJKzWTomztpIVTaxPAqO
 eD64M1M45k+f7ow7x4fKi9VlnUboTKmeXzdBOD2j5C1pr1T3mcwIo7cDlwZVOupzmune
 t7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LAkTWKPF1L+2A0PhDARmJsML9Mso5yYImS7YCN65w6o=;
 fh=uJDZVxx7sS4kh2p+fV5cgNEmajOzaySOHhqwTa8ZhJc=;
 b=VwQKmH9eyAXoYhp+UqDdZ9e0Doaq23EupwhPAVz55SOIsI5/rdqY9UPsXqeYhVISxd
 9+NWBkLNcwwY61zTdhY2EhShRalMixOXEphEoS6ayT4151Bge5E65oEGp4kKEwSgjus2
 pqhTMPxx+zQtAvNghvNI799I1x7+p0TfwFkKDGk3GGChPgtvzTolPey7YpVNFkIiM26y
 iiX+eCfAJmv6KnMOnHMEudvTbSDBJm3ggHeF0JOs7zVbSAtuZGqfKseN13aLXFgxSHAh
 9MRQI3DZdvZBsU/4tfllaPHzFZDpNv1YT01Z1GRwQbfFsEAhr9ecKwA5nR+qDhD3vG6h
 xkKQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772559910; x=1773164710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LAkTWKPF1L+2A0PhDARmJsML9Mso5yYImS7YCN65w6o=;
 b=nqYqX3FOmBPRyq05HtocRMP+O7kYTXiVdhGgN7yBQmZKYaS3IMHyL4uCOtuuimwaB8
 11k76rVVUVC2SDmqbIeyyXRxxvcRxNZ77Gt8xpwdjBibh9TW6rHYKhrrtYMbhHf2jc+j
 sEO3nNQ2VkX3YkJmboQhohXJUDDxN5pDSK6smjgswimoCKwbWOlVJx1XZ8oAeFhhpeaj
 5mw7SANRXpJRXCe8G5soaq0eF6ipKYM0P/hfvKdBdwQPL/spo9Jk/f7FMqn/E7LyJiLK
 lXhtrJbavUJannbSvzvt+T78h83Xpdzw3Zi5YEe/WlBSHn8fAqCmaNcG19iu+db1SBtj
 ejJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772559910; x=1773164710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LAkTWKPF1L+2A0PhDARmJsML9Mso5yYImS7YCN65w6o=;
 b=p2qabBHfdyP3TubvpiXmIHkytBE8RiKLiDl2hI2R+GkjgdQDGxQxrWDyaxq9LWnzLy
 HfsDiYLOCjTTACqdEzMr56oxiCs8BeqyHPAQ2HnEN7Ra1UqzTcCm3pOy7D64gNiSodsg
 9Ol4hELSDC739XDyPxWW3dZ7dbYVuiAQO43wYIsWuILHtdSq56YP0xEv8RD1sThjzmDw
 0RiRHqz65X4vazfqCTU6udKBU+NCJhGRiZDLgXSHIHBn5KaesTEq6ALF+G1gCkzUp+Te
 2QUU5K0cCvBARljB89M+6t4x/OU0NG11NZGiNB8liDU972HiA+uTBb+1scU+vwhv+Aax
 Ru7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbZjKzWvOB4z1D7m1Qrn83rgjbjsF+SZX0S8p57gwPtGhosNFWunwRjMFZ4GyNi6UQ428CdfUoq3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0U5R/oKm0KlXkOMvPFe8WWf4YmJyHR48EmakWc+h2C6U5RrSU
 RcTSShKRkhk2jbWYi7K7yi17VVzDnSY/lbNdMWPNAtKxCuMqUVT1HP8VhzPHXyb5EGSmdR4Apub
 hCXE+Ryc+IAihMfhSiNLrFl2KhlorMW0=
X-Gm-Gg: ATEYQzz/PT5exLgSlId4rnp5qi2phgpQj2drS3d7DaRCpY2vB5qV0xXxlyu8WdERta1
 OGAY47LMQoO6K5eaMKk08RArM+ftMMUQ7oIO+wK1Cif26JMBaz2GBC+vH/moPCjcADQMUJhTTID
 uTButg1Gl70vwUpK96W3Z9Dofe7jCXRf/tGfnNgNeTGXs125Q+TqeugZ2saBCWRVe/7fSlmXECM
 ECh4CWD1pY0KunxMt6GuP/dL5SdqOI7XhgSVuA/4GVvMJOVWb0HXZ6twfnvjKk7zBOg3ggLbFyR
 6j8LUE1R4c2cVCcg2vI8kGmElRoYX8ze0EOaiIPXyqgXdMN7jZBZjqnLI3c=
X-Received: by 2002:a05:690e:d09:b0:64c:cfae:a9fa with SMTP id
 956f58d0204a3-64ccfaeb115mr10639080d50.62.1772559910262; Tue, 03 Mar 2026
 09:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20260301-point-v1-1-21fc5fd98614@gmail.com>
 <e0f687da-7323-40fc-af50-82abea6e25cc@linux.intel.com>
 <3c969254-ed38-4b13-84b3-5afa365b04cb@amd.com>
 <2b75199f-b78a-4915-8e75-5d186f63f7c5@mailbox.org>
 <CAHijbEXkn3+E_u1+aZgLT+pQ_vLYvKKv9VU_5kOuEaFheLRQeg@mail.gmail.com>
 <bc3417d9-d191-4cc7-95e0-968b0b9bec05@linux.intel.com>
 <CAHijbEXTPSLSADqet1=P1FV6jvoa5yGEprOuYtpQWUq_y5uT2A@mail.gmail.com>
 <c5e2cd1d-05a9-489a-be8a-be4d0d583688@mailbox.org>
 <CAHijbEWoQHTyj_V1dD9UWskPmz0WbrVwzPTD3XqJTczy1ojBnQ@mail.gmail.com>
 <d90d6eb3-72bc-4502-934d-f77dac83690d@mailbox.org>
 <88726fec-3bbb-4ca8-b724-c281b5696324@linux.intel.com>
In-Reply-To: <88726fec-3bbb-4ca8-b724-c281b5696324@linux.intel.com>
From: Julian Orth <ju.orth@gmail.com>
Date: Tue, 3 Mar 2026 18:44:59 +0100
X-Gm-Features: AaiRm53c4w8YHV9uOuHUQHYNsr-8B4HJam18JTL0snP00tKoIn1YMrZNKZeQuac
Message-ID: <CAHijbEUJkZHw4DeE4wmeD3dvEcnGXVqsHDg7QHHa6i=6LT38bQ@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Fix handle <-> fd ioctls with dirty stack
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 04 Mar 2026 08:17:10 +0000
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
X-Rspamd-Queue-Id: A10D31FC619
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.osipenko@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[mailbox.org,amd.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 6:41=E2=80=AFPM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> My point is that it works for old userspace without problems. It's only
> newly compiled userspace with new headers that will run into problems.
> The code as written would have continued to work, but if you update to
> the new header and don't initialise the new members then it's a userspace
> problem. It should not be worked around in the kernel, since it's newly
> written bad userspace code, not old bad userspace code that stopped worki=
ng
> when the kernel changed.

But it's not newly written. The example is, say, 5 year old code. The
binary that was compiled 5 years ago works fine as you say. But if you
take the same code and just run gcc again, the new binary will no
longer work.
