Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78B756FA1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 00:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4508F10E2B9;
	Mon, 17 Jul 2023 22:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6892910E2B9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 22:12:20 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-666e6541c98so5102813b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1689631939; x=1692223939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nfZGdLayIsQ4EXLbarw1/OO0pNLBzQdwR1vEqsrzGII=;
 b=Jk8Ffu+zgnI1CsgL7PShvnMc/G0hm1hbh3TPz5Fbc34BI/VC6K+YvpO0Dtz1Q06LcE
 vf29m9vckcSQeAqUEVUy2hQg3wChzTMiZjPdUNSWsPB40TqlA/Z3Z90RDeI/5eGEIh5a
 oHIWxzri1XJMuhuB2UIvkNGwKQM8BtpRM8RbCOHyQCc7eetsY5S+VbcO2iAUIljyLIvn
 7DgUtRFxxg3tnphZnCaerMskJ/OIgXT3e8pOBne6YWSI+yYb8YG43ww6ejPC+GReMaLK
 AQZU6DLVDF3nw8hq4CMA6FGa2JzmC2rObjfL+xz46TVHFpF838cUJw0/Qyn0hTY2P629
 8fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689631939; x=1692223939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfZGdLayIsQ4EXLbarw1/OO0pNLBzQdwR1vEqsrzGII=;
 b=HLEAw8N6cSFhDKjvTUpd8m1wgjLLu/5qg+aan44vishHy/udyJLMXuHjjz9Ocylrgz
 GRXA9NjQub45CA0QNehyq2NZYB27DdGAXs6nOgkcBwnDN5mqnof1ncg5dOf8N7zQjavS
 Eb94DG0LRKj4maYCGvhN3kP1a1+Yb+DA3g19jzDrihC9C8JVnDIhii2pQmKHTpehh7kb
 8VVvd/0OVpKLbsRj2fubPcnLcwjYj68X5BXfopplb9YCMptci2lHbjSpvlqAdhBYR8EF
 qEKGAGhALYp68KnaFtZEyvaGaeCAntSdR0RyqhS6Tb93NMfMNPihd4s91qhZ+Q3hTM7y
 WCfA==
X-Gm-Message-State: ABy/qLbM+TzX9rJlMuCH9tsCcKC48K8MFuBxRR0osG0O7szls7w/K6X5
 867uoIW2tOe7JjepaE18REytwQ==
X-Google-Smtp-Source: APBJJlGZQPlE97VCyl6VDpxaBgXkuk8Xeb/cb5kTAa5gNdx+KBrLI5Ve+dnBz8NdMBvhTebPf2Gh3g==
X-Received: by 2002:a05:6a00:2307:b0:668:81c5:2f8a with SMTP id
 h7-20020a056a00230700b0066881c52f8amr19367164pfh.17.1689631939323; 
 Mon, 17 Jul 2023 15:12:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.25.194]) by smtp.gmail.com with ESMTPSA id
 q185-20020a632ac2000000b0055fedbf1938sm278952pgq.31.2023.07.17.15.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 15:12:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1qLWS0-002PFZ-GX;
 Mon, 17 Jul 2023 19:12:16 -0300
Date: Mon, 17 Jul 2023 19:12:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <ZLW8wEzkhBxd0O0L@ziepe.ca>
References: <20230630155936.3015595-1-jaz@semihalf.com>
 <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
 <CAH76GKPF4BjJLrzLBW8k12ATaAGADeMYc2NQ9+j0KgRa0pomUw@mail.gmail.com>
 <20230717130831.0f18381a.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717130831.0f18381a.alex.williamson@redhat.com>
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
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org,
 Kirti Wankhede <kwankhede@nvidia.com>, netdev@vger.kernel.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marcin Wojtas <mw@semihalf.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, x86@kernel.org,
 Halil Pasic <pasic@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Xu Yilun <yilun.xu@intel.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Dominik Behr <dbehr@chromium.org>,
 intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>,
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shakeel Butt <shakeelb@google.com>, kvm@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>, Grzegorz Jaszczyk <jaz@semihalf.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-usb@vger.kernel.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 01:08:31PM -0600, Alex Williamson wrote:

> What would that mechanism be?  We've been iterating on getting the
> serialization and buffering correct, but I don't know of another means
> that combines the notification with a value, so we'd likely end up with
> an eventfd only for notification and a separate ring buffer for
> notification values.

All FDs do this. You just have to make a FD with custom
file_operations that does what this wants. The uAPI shouldn't be able
to tell if the FD is backing it with an eventfd or otherwise. Have the
kernel return the FD instead of accepting it. Follow the basic design
of eg mlx5vf_save_fops

Jason
