Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBCCA024E7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 13:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A4A10E201;
	Mon,  6 Jan 2025 12:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="P9I90ypT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5374210E201
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 12:12:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-aaf6b1a5f2bso1055555466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 04:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736165480; x=1736770280; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mR8gi6U4cwYS0aW4/hxecZgCrBHXc4kljGv3GyLWPoI=;
 b=P9I90ypT9/xF/BZJed5U/GF2fNkhaWm+xjpP9QTF2dPU1KBW/Z4sMoN7uFeRdp6K8p
 sViGgD9zSFVaDDyA43gLi+aA62JEoteZR+MmZToS7p42nkQY3BckHsobp6B7dIOU/vSB
 v90JaWoLwST9DAAAGP/b1LAlF1hpAA48S4Jvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736165480; x=1736770280;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mR8gi6U4cwYS0aW4/hxecZgCrBHXc4kljGv3GyLWPoI=;
 b=ShMptI+2/XTANXzpk73Oc0eQN2tUvxJ4jRAIdKrO8tvQnfhdn5e+AUN55D8nNqlZ+j
 36K1I6G1cUkIqrFt1ZMdcU1Pl1OW1NLAhgO2pJgxkDSGScQf6POsyeuw0ZuwTk30c/nE
 vO4hm6MPqV8yhF+npzlhD21yvd5Pzf0QhxC9+J4hQmZ13rloGV0LzWD7JzIHN07L17y3
 /OW3QjjrgzkRpW9BhHQPo4juaB5OErpwwnbGzAywwChsvbcGYzVOvCJC121xOZGF1aaN
 6cfLdFDt5CoEoTXgG0xqwNjUSALfx9/cB/EK+e/jtwzguF4JS3OW32C+wRkVgqBxWfm1
 OKvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqXwJ/dK8pChZzE2VXTBQUAMcKu6tW5VdWs6LxcG0mN+28pvzmZyoyWlUx7gfy1E2mhYMJwFrFcRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJRmYFAtMzDYjZLnLV7kF1WyfnVgaV9f/4e6bxIEv0N1lkNCv0
 fx4yDH90Bf5vPaHo0f4nVE6VtMh9b+k8j2HxpvhGGHmdqCXRXEgkNwxjpqDNaQS9TY7FkMQHN4a
 ZdBM=
X-Gm-Gg: ASbGncvDUkudsvFT7tqn+TLyaE1M7arolpebAwpgD0yz7zpQh0hagoDEijRxBzi6nNP
 wWZDE5qWOVz4AFbkFcMSadgJNRsSFGTjZcKZCBkpWo+rPVY1H8SDSs9PJ6YP5+TZfS4h33Z/kfQ
 C/B9aM7dxIEMq4E2FKAXGuRY9QhtvZe5KN4JZrw67fV0pl13CPfnOefQQKA4TNEMwC5u3ybsut5
 IQO9TsHm7qx7e6EstcyLhhQaFsi8PfrTFqyvK2MO0RpCZEN0i+c753UjoT5JMl7kAOX
X-Google-Smtp-Source: AGHT+IGqrYDLO8WuLsURv5mBKdZnSYgPAQgK5+8FmFCtidEbzqmhldfGSWYEyPKtEVnMyQ4Knh1myQ==
X-Received: by 2002:a7b:c3d9:0:b0:434:ea1a:e30c with SMTP id
 5b1f17b1804b1-4365c79aa7dmr532914215e9.13.1736165110894; 
 Mon, 06 Jan 2025 04:05:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43665cd9c29sm548387705e9.14.2025.01.06.04.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 04:05:10 -0800 (PST)
Date: Mon, 6 Jan 2025 13:05:08 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>, Keith Busch <kbusch@kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, Nicolaas Viljoen <nviljoen@meta.com>,
 Oded Gabbay <ogabbay@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <Z3vG9JNOaQMfDZAY@phenom.ffwll.local>
References: <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
 <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
 <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0c7ab6c9-9523-41de-91e9-602cbcaa1c68@amd.com>
 <IA0PR11MB71855CFE176047053A4E6D07F8062@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0843cda7-6f33-4484-a38a-1f77cbc9d250@amd.com>
 <20250102133951.GB5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250102133951.GB5556@nvidia.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Jan 02, 2025 at 09:39:51AM -0400, Jason Gunthorpe wrote:
> On Thu, Dec 19, 2024 at 11:04:54AM +0100, Christian König wrote:
> 
> > > Based on all the above, I think we can conclude that since dma_buf_put()
> > > does not directly (or synchronously) call the f_op->release() handler, a
> > > deadlock is unlikely to occur in the scenario you described.
> 
> Right, there is no deadlock here, and there is nothing inhernetly
> wrong with using try_get like this. The locking here is ugly ugly
> ugly, I forget why, but this was the best I came up with to untangle
> it without deadlocks or races.

Yeah, imo try_get is perfectly fine pattern. With that sorted my only
request is to make the try_get specific to the dma_ops, because it only
works if both ->release and the calling context of try_get follow the same
rules, which by necessity are exporter specific.

In full generality as a dma_buf.c interface it's just busted and there's
no way to make it work, unless we inflict that locking ugliness on
absolutely every exporter.

> > Yeah, I agree.
> > 
> > Interesting to know, I wasn't aware that the task_work functionality exists
> > for that use case.
> 
> IIRC it was changed a while back because call chains were getting kind of
> crazy long with the file release functions and stack overflow was a
> problem in some cases.

Hm I thought it was also a "oh fuck deadlocks" moment, because usually
most of the very deep fput calls are for temporary reference and not the
final one. Unless userspace is sneaky and drops its own fd reference in a
separate thread with close(), then everything goes boom. And untangling
all these was impossible.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
