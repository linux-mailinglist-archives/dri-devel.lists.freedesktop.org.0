Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLtuBchKp2n2gQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:55:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B91F7042
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 21:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9616010E06A;
	Tue,  3 Mar 2026 20:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ONQhtvTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCE410E06A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 20:55:31 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b9382e59c0eso727210866b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 12:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772571330; cv=none;
 d=google.com; s=arc-20240605;
 b=LHYBY9tMRXJ5a4/tGDX1QimhoO2ty+jZLcpV6NmyHnP0SL6U7VvT+QW9TKCS4OarMC
 uNMdDf5EHm3LmO2mlLsG90kBjRkR2rfu0BkaI899r2Wv0V2Vs3FJurV29t6ysjoS0fn+
 Dyb6bRlr/I3ozeuIP2IcR7oC3Lx+3TM3ERTzoWoC4qaktpgrM9Xw9M+K/qBhvVrZGLMs
 b1btIbQZVeugcl7PMA/e71VWpeBzVADsWqFAvUqAaKXrBuASlIVMkG1SJ65LXBhxITGV
 rJTVrm1XEGiFxwmmhyWErQb5VV2F3E2mnVNTtJ7VSyXjzw/61RdJMnSkqL2ltItW4B/V
 rENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QTcUFUPPKl9O5H+yEy/BveB8689m0SStI46+e//eW5M=;
 fh=xR4IuBL5F3dBz0Y5gm+NeMv7BbsUzSYmLaLW+0DWFgw=;
 b=SdXE28NFxNqIevDatN2YlMGvfKlbpC02Pl+gqHf8LN1BODb8+M4A/APMSqefeEqoh8
 BF6YVTSHo4D9WttB+xi0B04FYEJ4OpnM8wQd+UIIWGrjXw0hFywnXDWTi6tD/zqElrgp
 H75VwOj0cd0jEDZtEn48h0sbFMpyqobTAv8V8BlTkpOvqOiq6Io2tKFlicqSKw0EcmpW
 abic8sGj+SQ4cU2X7PaWHTcIzSmMMZUa7auS+OjUIwFXsGxE7WR+YHc2PfUvsTJC1dK1
 58UdLVrzBYdAsRg3spGqotZroAgnMalutyiry2vwFfwaxeYHcjuXOZsG2hJURduf7onT
 d+Sg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772571330; x=1773176130;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTcUFUPPKl9O5H+yEy/BveB8689m0SStI46+e//eW5M=;
 b=ONQhtvTf868RpUUp7Jzksn5fehnNN9yO2rbqlt/5HSOY66lMXoo1WA8/trXcrj+J/Y
 LyTCtLG6+AF3EWXB1GqaVAbcmbuyD7zbXUrhB6ir7uVvdIJ9QEm+lbcWj8iuFU02GwHG
 VSxx4gpR+/B8RPaw9eDQPZUgkuqrEzodlba3azkDdb6tqXEFBcY1YcwPW7Sb8OcTZ/3Z
 6SbK+rr4Al/74TQNZTLlSUeMa4a/ZExhdUo2pGrZ9pxV/jszOgQxxz1doRUBv3luJiua
 ELvvzFc4fGonnF1YGSZwuW91u4JghXrJVZZBc6rn97Dtafw2jsT8bD+fFNdZnorKmgDh
 fjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772571330; x=1773176130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QTcUFUPPKl9O5H+yEy/BveB8689m0SStI46+e//eW5M=;
 b=Krb/66GI6Wx2H1tBO45EGO8qocsrOkNB75ap9XmG7fL5wHtd9rPGLDtHezpFOYB6aP
 ueRKyLu24vv6YixMKCEp6apLmw5RgslLePi2VtrZ9B4LxEhIA0ACfF5rt4778aHlUHux
 /D4zx/NF3N9b9vLXOfSCFlYM5k9J5cghVtCo9mwLv0O3btRVcv+vnJ7oP1Hg97K1sqRi
 ntFBNeBPBI+PtoxKuxTVM6MJbB0/2Y1bibP9O1iEZb3hC1eD6gKlrukOrYt+V1ERk9Lm
 GcwN2jx++jY9/EKvAyg+MAmc7XV1wDP2nYcTSW/9NM4c0j4ZBIkBKFTvHNkM1AtymiiN
 ZgaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURoHVi7hC/fBzPdLAufOoRyiINtJxMgmR89HNYaM7wWaqSPW3ZRakL20Pp7Ev9IqhOhObGbOzD+GM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZazFbn30zvXq3CrX3uuqspSABakip4sMxP/gI+nKDBLG2ZbZG
 QoMnT5CJznYMOU+xvdT/v6765aCCDomOd5e+8JSpCMJLrkJdSqPForBOkQ9p3LWaF/Doz5SESP6
 cQpYYjjaBtLjLobrDE1ezsLi9PUuG/QrmcitPlRs=
X-Gm-Gg: ATEYQzx9MqWSXeTMFkLLPCu47DyFdwlnz81m9LSP4zxDBvktAWfjMk0r6QuFnaow8d3
 Vc0ph/9u08P9Gjb9orTNQVjiLKtLTjWhNkGPKFLVJ3ZsiluDt9toQyUh9lhFLSjYxUViYecE2EQ
 kE/M+i3nPe9LpypIodw1bHFCykgAeDxxAxuQ0UdeW6ouhLpILYC/fZcwaV38bv3rnq2E7D5su0u
 EpRf8WSMyoJY5iMooql/bx9kdT/wEAjvlmRay+fYa7FkPHZfeoe8tDxH1nHK+u78lb9lfN8C0lv
 5hOy+/MthtWP7F0iowKiULjWIFKoo5vTBBqh
X-Received: by 2002:a17:907:3eaa:b0:b87:117f:b6f9 with SMTP id
 a640c23a62f3a-b937636cd7amr1077404066b.8.1772571329176; Tue, 03 Mar 2026
 12:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 3 Mar 2026 12:55:17 -0800
X-Gm-Features: AaiRm50eZ6b1R9zR4BWk_SQv0E5klHORf7__0-5ZUwkb8RwaEPVqJM-v_erZHak
Message-ID: <CANDhNCrVVGsxEjgRcVJSn_E9WPUVY_9zpd+t0X_Jy7JqbcHDqA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] dma-buf: heaps: add coherent reserved-memory heap
To: Albert Esteve <aesteve@redhat.com>
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
X-Rspamd-Queue-Id: 6F1B91F7042
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
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:echanude@redhat.com,m:mripard@redhat.com,m:john.stultz@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 4:34=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:
>
> This patch introduces a new heap driver to expose DT non=E2=80=91reusable
> "shared-dma-pool" coherent regions as dma-buf heaps, so userspace can
> allocate buffers from each reserved, named region.

Just a nit here: Might be good to provide some higher level context as
to why this is wanted, and what it enables.

Also, "shared-dma-pool" is also used for CMA regions, so it might be
unclear initially how this is different from the CMA heap (you do
mention non-reusable, but that's a prettty subtle detail).

Might be good to add some of the rationale to the patch adding the
heap implementation as well so it makes it into the git history.

thanks
-john
