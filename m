Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9180203020
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BCA6E1B8;
	Mon, 22 Jun 2020 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BDB6E9BF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 19:51:45 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l6so6475119qkc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zP3mPfj8fYVGpA7X3i9lQw/wDhwl6Nv+h6HgzhW86WQ=;
 b=MMmRJ8t4j4VSr9X/gdvrRhfckKKnEPttgsjRqD7r42N3dR4TTyyqhwnzRR2Zmqw9vU
 /eO8RZr/A4nHSOyE8HOfUMCXLr5V4yKzT96SAI89H9oM6ivtb11eu4o1b5IwFl/nQYDG
 BnpCLEibfwPpM+qQe2fTwD8TqkotDnif2MXx2+W5OqJhUu02J9GSkKwpu8Dh9btmlQsW
 HfPeSb4neRXQnhdWbAQBoeJfQU5yXw4BH7QCQBZFfTz7zBx/ENEemRvnCmMQHQcSOvEj
 0arcTcBmJyDOK1t36aFed0to462HbPkMSNhWvaHJO5I28iu9xV3xW3atg8lfxqqFsEQb
 IKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zP3mPfj8fYVGpA7X3i9lQw/wDhwl6Nv+h6HgzhW86WQ=;
 b=MlZXawfR8LKeeiNRYD/J1K00p5x5tAhFRQm+gtYhRHeR+jTk+LrnW2bjvaHn9qKRX5
 NVEyRfE2K+dD79Tg/OQ148pu37nPB9czEEGaK9ROVyITJCVGvNglCpY4DDYcT3yL67pP
 6vhS/BiwCZphOCX4JJHlWKmk4Cb8D8liTVqagnUlfBtXOFDUNU9ArifbCfIzQOFIH4XC
 H54xJ+29EUFpJZZSlryUyQ4nNHETK1bcUd6Z8gF5YRm0ueiDf4dk0PuGLyf7FHRgCMPl
 7eeR5v64xaFe+HDt/0U6pUP4K7ePtkOFVMx9N7Om9UCdqSngtSFx2NT3B4jh9VOtfUzB
 vAOA==
X-Gm-Message-State: AOAM5325ABPEuVNs/kZ1bEdztk8AielmH5jo5vuQAS1RGTWaIPR1cnqy
 7tvh2Zzn54cYCA9HdQjTaBaJXQ==
X-Google-Smtp-Source: ABdhPJyeNbiGf5pDE6/nVlB6izIza9irK+wIFfmkUW9Wq6/rfhl4M8xllFEi5LwJ5619wnq0QRE14Q==
X-Received: by 2002:a37:b401:: with SMTP id d1mr5401845qkf.206.1592596304691; 
 Fri, 19 Jun 2020 12:51:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id a81sm7609057qkb.24.2020.06.19.12.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 12:51:44 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jmN39-00B0gQ-Jd; Fri, 19 Jun 2020 16:51:43 -0300
Date: Fri, 19 Jun 2020 16:51:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200619195143.GS6578@ziepe.ca>
References: <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
 <20200619180935.GA10009@redhat.com>
 <CADnq5_Pw_85Kzh1of=MbDi4g9POeF3jO4AJ7p2FjY5XZW0=vsQ@mail.gmail.com>
 <86f7f5e5-81a0-5429-5a6e-0d3b0860cfae@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86f7f5e5-81a0-5429-5a6e-0d3b0860cfae@amd.com>
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:46 +0000
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <jglisse@redhat.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 03:30:32PM -0400, Felix Kuehling wrote:
> We have a potential problem with CPU updating page tables while the GPU
> is retrying on page table entries because 64 bit CPU transactions don't
> arrive in device memory atomically.

Except for 32 bit platforms atomicity is guarenteed if you use uncached
writeq() to aligned addresses..

The linux driver model breaks of the writeX() stuff is not atomic.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
