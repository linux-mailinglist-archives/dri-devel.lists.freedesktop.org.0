Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2490B161
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355410E13F;
	Mon, 17 Jun 2024 14:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="fdnW6sn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CD910E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:17:41 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-795502843ccso253861985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718633860; x=1719238660; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gJB3RcNBcE0/JpE/eNjRla9bs9uh4t4dRien+AQ6M84=;
 b=fdnW6sn6pPmtCbw/4ihViQejOaBdpA8em3GiojkbP28NwW09fIiYBvFxXhZcdGWRle
 sc2bASMbp9/Xy5Swx4bL6oF/hUHScTzMeYKmY6kf7xka3jjhnMy7x/FtNg867YyP6Ua4
 6MC+ABEQ0Fm7AJvcDK0OKTmrLOquG9wOIgmvRcvsSBZKGC6ahngTblZqCp/r9SdSVqnv
 Ah5VqRFynH4/nZly3t+a4rVAiDbYFrSEi27e+7P+p/yEtUGI/itzAQU0q8cVnDz7nKk0
 4EY4No5h1FqcXiI55m0ITJ4NVA/XgH2abwvAvPH5pHQ0n69Gf8+HHT8IpXxkMOqcZskF
 OX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718633860; x=1719238660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJB3RcNBcE0/JpE/eNjRla9bs9uh4t4dRien+AQ6M84=;
 b=PY4yVcRBq5u4jjSoaX50aafYuTZsoFfZWkxIt6omAmtOXNkZ00NBXdCyDgA5ZD0HH7
 XC+Cv6qZa+uEM05ZXW/p4ZxVwqQ2Asa+oY7YWTlIptWMqszYBm7ZNPZ/cpGFgmhlWHRG
 fmjP7/7qbfmMt7oJjNX8M0Vt4OEbXr/N4RJtY72i0hF0UUDctdqBLxAIl2HGTwRoxYzl
 kA6FpedbmBflbRXp+l6elTtDI3cDWyBQAOs1GwoPE/cgJ2KZhTt2Zc4DIttxyZNWb28n
 NVyLjLfSN8YMuvA+Lxz8OOw/IIf4QBnRJ75sWEOKvAadWYPL0IENEZP3HwhPznI0sV7T
 KQkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh9dKfKhh0rXheEo6NAqmWcLcHO8bWthcvq0dbq/S9XUdY4zYfPpeCdHnuATMyiBRKuCjfQ3adBdN3M42A6RadFe6wV/raKu8BJ6zhNltX
X-Gm-Message-State: AOJu0YwXiv0ga5EzxLnTK1Y599QCN+0BSUc1FzRW0PZuqaKPNRtvCk2W
 dj4Fo4Gg0mED8NzmQXD19HU3LLQfpEoa6CtnQ1bXbLi50H3NAHW8MCTW3nVQNXI=
X-Google-Smtp-Source: AGHT+IEeVElDnFU6HjCerK8KBYMeNyuzItK5u6pJekKDgwB6IP+lwMt8s0nxNZxohhF7K6rO8Pl5rw==
X-Received: by 2002:a05:620a:248b:b0:795:59ca:5066 with SMTP id
 af79cd13be357-798d258e2e6mr1129033085a.53.1718633859951; 
 Mon, 17 Jun 2024 07:17:39 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4420c5e8e4bsm45859201cf.39.2024.06.17.07.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:17:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJDAw-008eAR-Pl;
 Mon, 17 Jun 2024 11:17:38 -0300
Date: Mon, 17 Jun 2024 11:17:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org, zyehudai@habana.ai
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Message-ID: <20240617141738.GB791043@ziepe.ca>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613082208.1439968-12-oshpigelman@habana.ai>
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

On Thu, Jun 13, 2024 at 11:22:04AM +0300, Omer Shpigelman wrote:
> Add an RDMA driver of Gaudi ASICs family for AI scaling.
> The driver itself is agnostic to the ASIC in action, it operates according
> to the capabilities that were passed on device initialization.
> The device is initialized by the hbl_cn driver via auxiliary bus.
> The driver also supports QP resource tracking and port/device HW counters.

I'm glad to finally see this, I've been talking to habana folks a long
time now to get this worked out!

This will need to be split up more, like others have said. I'd post
the RDMA series assuming that the basic ethernet driver is merged. You
don't need to combine basic ethernet with rdma in the same series.

Jason
