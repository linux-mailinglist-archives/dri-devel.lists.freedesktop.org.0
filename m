Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4D092FAE5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 15:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1287710ECF9;
	Fri, 12 Jul 2024 13:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="jV4CV9bW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC9110ECF9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 13:08:58 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6b61bb5f6c0so7338406d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1720789737; x=1721394537; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B4jYmwN/QXFZLbYovizkcE85YvZFmyIlwRDsiMLcnTs=;
 b=jV4CV9bW023P8GfEe+vQRKREbDlasaZe+8gJU302kqa2/jDsBAD5ewogxSfRRa5cSA
 L4V1WZ5Ft/kumo4Rj/jL/Mwym+cLDzFVRozkeRJ6rfseoBs45xf6m7I7dADKmBY8ZsmI
 z3Qr3mXfRBgjBbjFPXQWmwJ2bXHkRxHaFXKPTt0xfA5EBMfQ/JumPCosdZMVFH+Mote+
 XadM3cteJz3XC4n8Ov6hdEdul+EzirI6GENJuIQO3ONkHC8j8so+IIJWJ0fpVNbp86u/
 xTLQ61sUInmzcBCG3IC66sokxxnYmZRGukkwRvywFa95fca57g8Krdk8MR4Be//PuPna
 pzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720789737; x=1721394537;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4jYmwN/QXFZLbYovizkcE85YvZFmyIlwRDsiMLcnTs=;
 b=WDU6YaF2/pX1HVusJXsp84axHX+2db0ru7PJvuTG6xS0nmgNM+elRiD6zq4lvLzNf3
 nhglErncKrETUQR5QdOFvO8AehnBlam3W7SkcvMUmaC5KlKthpfdfqy3UTAZgU1AzdNV
 RR8kbgnxl5+A1j/AG/bafGEICaYkrqPNIopFHpUdPoyjovt40h3WbymMVv6pJN5mL2hl
 o1Lw2nb79q67OsVREbw8VdKDOAT2f7I9QSA/EJtQocjMyyTBY/9cR9ObxK1xTZWex/BR
 epk39b9k3eGxPfZUe4iAyW9qlb/kx1Jg2ugI1WXh3Fu+GIGFJvrbQoSAl3WZcxZ3nFAw
 ZXxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4MeNgW8qipFjXdBhnApyVWvvDxmwloNYm1M36E20r5XNB+aH/ROopFkAnQOy/zKND/PxsHkehWGLBI50xNR24qrkBJEVf0H+LywxIBmHz
X-Gm-Message-State: AOJu0YxNMJmKdQ+91Xb79z39Dmci0Fiu5lK01vwWDl7sjlxH7kNiiLa4
 YwNyEgv/aMYCPFdcIdOGqykgBqgj480mmyUIWqjz5CmbTa334DFcdk66SsKFii4=
X-Google-Smtp-Source: AGHT+IFoKtdu5vK1LEfozhtRvZwJjwwZjN4Ys9l4HkSqkcIyDGM+PoG745Jm0+Iu/Vp9ngs915k4vw==
X-Received: by 2002:a05:6214:27ee:b0:6b2:d335:e914 with SMTP id
 6a1803df08f44-6b61c219e19mr144274106d6.52.1720789737313; 
 Fri, 12 Jul 2024 06:08:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b61b9c4daasm35005856d6.18.2024.07.12.06.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 06:08:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sSG1A-000Kbx-Bd;
 Fri, 12 Jul 2024 10:08:56 -0300
Date: Fri, 12 Jul 2024 10:08:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Leon Romanovsky <leon@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Message-ID: <20240712130856.GB14050@ziepe.ca>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
 <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
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

On Fri, Jun 28, 2024 at 10:24:32AM +0000, Omer Shpigelman wrote:

> We need the core driver to access the IB driver (and to the ETH driver as
> well). As you wrote, we can't use exported symbols from our IB driver nor
> rely on function pointers, but what about providing the core driver an ops
> structure? meaning exporting a register function from the core driver that
> should be called by the IB driver during auxiliary device probe.
> Something like:
> 
> int hbl_cn_register_ib_aux_dev(struct auxiliary_device *adev,
> 			       struct hbl_ib_ops *ops)
> {
> ...
> }
> EXPORT_SYMBOL(hbl_cn_register_ib_aux_dev);

Definately do not do some kind of double-register like this.

The auxiliary_device scheme can already be extended to provide ops for
each sub device.

Like

struct habana_driver {
   struct auxiliary_driver base;
   const struct habana_ops *ops;
};

If the ops are justified or not is a different question.

> module reference counter. But we also get the ability to access the IB
> driver from the core driver (to report a HW error for example).

Report a HW error seems reasonable to me

Other driver have used notifier chains for this kind of stuff though.

Jason
