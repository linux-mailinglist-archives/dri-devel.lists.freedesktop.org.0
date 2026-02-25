Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L/DMABTn2mraAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:52:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB019CF16
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010FB10E215;
	Wed, 25 Feb 2026 19:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZEUzA/p/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE9D10E215
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:52:28 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48318d08ec2so11105e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:52:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049147; cv=none;
 d=google.com; s=arc-20240605;
 b=X0TCAmJoRwgFDgjht7vNibPuCDCLgBm3btLoTAU2VXyFeOJA3JoIKxYVrQKl/0OKGS
 zEwmWFgrPVHUOydWZlXEC0T6lVxK7+10a23xhZrzwsID2OBRmVIKAJ5R06fwYhkvDWR3
 yjWLt2V53pmQRyWKwYFmfC5oRYu7+/DSmSWxLALjSBpOb9Oh3vwViegvHoBcimUmilnD
 wMd+qB11JVCkp/0J+S94Y1TeVitQ+p74U80mudfXS1/SJ55EvhZp/eH1Uql8YR1cC6l8
 MG8IxKfSOoFUdroPnd5UcKgzPG+52eBJPpCjTBZ6r1zgpYvp7l5lm6tlgqwbZ86auhjg
 ddtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=GOCqpqP4xulPNkLV+0mavDjGZp2jPKuE2l1wLsJLWlw=;
 fh=FqQtzGkPQ2okHMLB27NFC3LqX8n/oS8ezdwL/xy4Y6I=;
 b=Uc6OSWxzQbkhL0I+hmSuitRU87E+sKPojrk5S7Ytva9TlhyO/pjxlVaDzM3cylavj9
 b9nMMun3i8U7cN52ykrkPCMwOttLcjp8nwhTOA4e/Gf80EXJdGRwLEBQZkykBTCNXdBY
 GwoOT0Oeh4V5rPcxCGsZfjhSfDI2VDI0qa7yzDQCQ48evSF2VidJwexbr0vsyfESS4Ov
 akKubbaz+2Pl+HQb/LsgVYifXyflgI6jxSKXBN41a/ZGhVKPfxeh52TklCmahlnspoIz
 XbnJYZsr9OhO8qVe9knvU24v3uH15g5japffUlyRmkcqCymQKI7DxRN24tS0FeuieOE8
 TeHw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772049147; x=1772653947;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOCqpqP4xulPNkLV+0mavDjGZp2jPKuE2l1wLsJLWlw=;
 b=ZEUzA/p/5yyAtd5g26t3pODm9J3tMd9xCASdM4etkkezgKfUbUZc/eAnchc/nY5pof
 nDsqGgi4EW6KfzGVbroXvX3z/NPiXFpdSQazcgefPhX9pjFsQVOx9Fjstz36ojjytqwq
 zZszUFRAVpGOJeC2yEli3S+LAppTSiR8AKehkOujioVCIsOXdqj4ug7qHjB3XFzziaGS
 W2+Mza9kuNNbTh4Uy0nsL2bV0HLT1vDkbJs0UkxhfJlyGE9kdm6Usz345Uh0jO/vbcmU
 znB+ELFA9yeVCCJAmmNAGHhOmIGSiiIDH6rfqnY4TF3KF8sT2uGbwoeZx3jw4NDPKEMd
 LUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772049147; x=1772653947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GOCqpqP4xulPNkLV+0mavDjGZp2jPKuE2l1wLsJLWlw=;
 b=o5tWUbC3hO2AQ0X4uFtnMloVJZmsTN3UOt3T0aQNAXwjKi1CFfocE0r5wUA0buHlAS
 jj4zDpO608WWMERlLT43o7qgDY727SwIj9JzT22qvjnB8GaOaFRoDuKSVUi7c7yBx6o3
 EtOpQeVeziLa5Expjmvbhyuv9/TL6RZ3ThNRxiQBnN3yG1IWZqFl6g6LpSVpZ84D5Xv6
 m1TgAb02CMo8Ut4DetROLIGwB9TFm8fIWZA91Cli8eZtGMBAP5wbBKKNTYdzlWUbb3nT
 egjNchzGInJZ0lVZIJHkM6HfqE43HEZZRSCXm/X2krkPvEgNn8NrYUdERwwUdtK6rw4n
 oI5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWawsKL6VkcifCdR+mrjd8be/e0AOmqd82pktkhSvSIYaxdQ897L5+TnOPit7dZOxJfviTcPcIFzqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMEdt4v2qs682OmUJOe9nVjBCyFOaZAdJgFg5/yfBqBQ5ZSzo0
 yT8T3LeqfpLhQlvxIYMRx490CSrj96ZGHqBiCwba5QhhCyAVBY1DA5Yc6Auap1L9JjobPANm2p+
 9N7VnpZI+vBZU5iO97c75c/CzafJ8BLkD2HEVfDdz
X-Gm-Gg: ATEYQzzZdzvoNMUhQe77JCqbADEHhZRhZli6+WmhRFyP8kgTgyQTYxLnfYw+2FXKf1U
 2OCeMezlAGrOeyl2sYNk8kqra6RPcE9r6E++Xq3XZz3iUJFz7u4IuZi6LwOLHJSAFszRrLxh1hO
 rPjk3EoJ+uqcOR6IOQe8gyv/9epm5hcp2DGlCvKyZn6pURbfBoQS3XFz7O02arLwCV9pEUQr6Kp
 9CDd4iCoczLB0GOMt1xcQcbXKpn33a+4urauVOySEzgU317MQ3CX50S1V7ofvoVNC3jyM4LAfpc
 iYaL9DGmAUBvYsTJBnnix7HaY4n/JQnzfHm9MT7wY3VsS8yqEJYqDF0EcuJVcsKNAral/w==
X-Received: by 2002:a05:600c:5702:b0:477:95a8:3805 with SMTP id
 5b1f17b1804b1-483c31cfb56mr70235e9.15.1772049146264; Wed, 25 Feb 2026
 11:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-4-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-4-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:52:13 -0800
X-Gm-Features: AaiRm517LrodfDPDmk8aF233zMemSo71i-_zn9eOj5ImN-lsr29tVaebY-ntsoQ
Message-ID: <CABdmKX1piZByQvx0sYbO4R=f1rdZKmYS5R0EcChBv22cAUvCUQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] mm: cma: Export dma_contiguous_default_area
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 25FB019CF16
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA dma-buf heap uses the dev_get_cma_area() inline function that
> would either return the content of device.cma_area or the content of
> dma_contiguous_default_area.
>
> The latter holds a pointer to the default CMA region, and is stored in a
> public variable. However, that variable isn't exported which prevents to
> use dev_get_cma_area() in modules.
>
> Since we want to turn the CMA heap into a module, let's export
> dma_contiguous_default_area to allow modules to use dev_get_cma_area().
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
