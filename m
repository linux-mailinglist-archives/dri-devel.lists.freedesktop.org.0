Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84151933CAB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 13:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E6910EA6F;
	Wed, 17 Jul 2024 11:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="QEMKXr+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4B910EA6F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 11:56:35 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-44bd4920ef8so38773641cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1721217394; x=1721822194; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WElkakyy4B3dqTGhkHumOe7VtwvtJDMdwvAuHtPPYZ4=;
 b=QEMKXr+EtGfvnMSYOQNQuWCXBrLa9N331ueeChcqbXT4RS6jjHrZuVI2VeYSGOhQaZ
 VTzop2g8E+eTKODXIBCjCrC2/Rr7ybOCYp9FqFuGde32u4yELY0fZiEpBEgpCwJavQKs
 NI4xvimuQtexi4aMuk5pI69QE2lSFhyuzbu0aAZV/0TehvH7hRey0v44Too32VfBtyZf
 qzXi/UNFoIe/BPWj0IW5M8tDFwPgoRQs8BHVDljcLFW1L8ULgg3RCl5Z/HbIht4/BNxR
 QSjfqKaWlRUduknKEZxE5Ss/ZSKMo2U7lsJhURf7kAxkqWmqw72bzMKJEIBjX6ym8YSX
 qPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721217394; x=1721822194;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WElkakyy4B3dqTGhkHumOe7VtwvtJDMdwvAuHtPPYZ4=;
 b=kBfSmBJ4miCkEqM2wVkWfHCs28E39xlJqkjZBKL3AOvr95FFoZSRA6Rv3INvide7RE
 40nR81r8WumiiJv95cH3CDK8TYlHmh8hgOltDSAUy9a9xs0PAx2q4qsG0WUfgBUwMV10
 hEpCI8XuxKi2k2v+INNdUreZTMZ1i9rWv2wFmHXCgDj7gOSgu8rx7169VWMtRGkIS3mO
 5yYB8r5qf+GdDr3W8zvQXIdNZGBIa/PXISyvGLtxk7+WDUlp4TkqHaSAOGkcg9MtVPNd
 wH+M8QzeZS1RVHVMn9bXuinM2ojFeBIqwHm5df6HeyGPOnB3cNN6deomNiz5rPV5ZfCN
 +ebw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3O8nCJ3w9KCnbQ+63mv/24abrsMubftQgxYAEhvZGQZrxpjDsYvOuMrN+Z85tpjTV+ijDjJHG8tkV/kiZFifYhk7AD3W8WLHPjhsNvoVp
X-Gm-Message-State: AOJu0Ywnaca3TYxDvlJSaxY1Fk0N0NBeHr7e4Hul0jYRtg6DnrDva6oR
 eRopxelnmF4DO53lPlu0IeW/fLP7ipuE3MWmDsrOxo9dEPy7Uiow3AjSvZc5ZTs=
X-Google-Smtp-Source: AGHT+IE/0Q/uXWsCRcJjxaWZkCF7Tdmfn9zPWdjtndHQVv5k5JZIMW+N7JiwOE20cY8Olz6fQuWeGw==
X-Received: by 2002:a05:622a:1b9e:b0:447:e40a:f61a with SMTP id
 d75a77b69052e-44f86194b15mr17153611cf.18.1721217394254; 
 Wed, 17 Jul 2024 04:56:34 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f5b7f0e7asm46534311cf.40.2024.07.17.04.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 04:56:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sU3Gr-00FTFD-12;
 Wed, 17 Jul 2024 08:56:33 -0300
Date: Wed, 17 Jul 2024 08:56:33 -0300
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
Message-ID: <20240717115633.GH14050@ziepe.ca>
References: <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240712130856.GB14050@ziepe.ca>
 <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
 <20240716134013.GF14050@ziepe.ca>
 <ca6c3901-c0c5-4f35-934b-2b4c9f1a61dc@habana.ai>
 <20240717073607.GF5630@unreal>
 <2050e95c-4998-4b2e-88e7-5964429818b5@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2050e95c-4998-4b2e-88e7-5964429818b5@habana.ai>
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

On Wed, Jul 17, 2024 at 10:51:03AM +0000, Omer Shpigelman wrote:

> The only place we have an ops structure is in the device driver,
> similarly to Jason's example. In our code it is struct
> hbl_aux_dev. What

No, hbl_aux_dev is an 'struct auxiliary_device', not a 'struct
device_driver', it is different. I did literally mean struct
device_driver.

Jason
