Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CFE2AAE01
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8730A897E0;
	Sun,  8 Nov 2020 22:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52D46E059
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:37:51 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s14so1588672qkg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 08:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1CDcjXV5zOC1KUdsTI194YdaJaRejWBY6TZu6uM074k=;
 b=gyduOqwy5X0evuo3oVFkBiKriwp62AWxOh3YpIfyJE1oulfWzoEJSHw6iA4Dsutosr
 dLSeDHxmA2vDN0YBl3t7e4D4vfaCmR2xeTTR4FBSnx2NmBFos134Y2LmvqSPPqaWJ7xN
 C0S+4T2qy3oJcQWwiSMXo5YB8pBYx9DRCtv0WtF+DNFHZDTl9ORnEx7R8Di5IW1oN1ww
 28WeZTWjjLfKIZLy6Kxjt0yi2sgfDlu/tfpqO4O3Ksq3vByEGa+IFjvsfV/0aA7WFjiw
 Cxbw7OnFud4Oxp/rOJ8OHfT/HHhV5PfNCqUeIbnoO3+yZ2PbTaZ2/VrxNS2CouX6wiPR
 10RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1CDcjXV5zOC1KUdsTI194YdaJaRejWBY6TZu6uM074k=;
 b=RXMG8z1MmgHJfzxywKqA3fxBKIpltoHs1q4/KcCzWG4rgoZy4BLx1slgv4SXknfosA
 9G2wfbX1qmwz2BQJy+CTNylGsa1YtJSU8sFYiFcuKwA8i5X+f22g7X3LuuFcYI8Ahgrz
 ffsotEQOF/8Wwz1tasAjDv+IkwRESC0JlTakmWXTxVO7lKX1M3oa7PidOUtZ6ijl8sOP
 LDcnQ32CxgMVNA9dHQa2F+YUisYOi57NGAuPvYa7bj37g5RaknY1lkJdjFbyXL5uzAaH
 qdZj5AiZVUpoRvYtTn0hYFqbU2LyFqpBmSlCtHN4F9gtuRoEHU/O+tIIj74n5t4n27RS
 dEMg==
X-Gm-Message-State: AOAM532+OvyvgSGc8g/jR4wwmeXIkcCpfShi55FKbg38eGd9lZZCOlw3
 J36ZsLQNWu/0aRy33ZCTIgwP3Q==
X-Google-Smtp-Source: ABdhPJzqt1hKj4/mfI1i1srDPyEST9aWdEgA9pLhUjft8bX9En9FCI9k50pLg3WSs+m8MZmaRhrE2w==
X-Received: by 2002:ae9:f44a:: with SMTP id z10mr2354548qkl.247.1604680670829; 
 Fri, 06 Nov 2020 08:37:50 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id s23sm830036qks.94.2020.11.06.08.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:37:49 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kb4kH-000xeI-Au; Fri, 06 Nov 2020 12:37:49 -0400
Date: Fri, 6 Nov 2020 12:37:49 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v8 3/5] RDMA/uverbs: Add uverbs command for dma-buf based
 MR registration
Message-ID: <20201106163749.GQ36674@ziepe.ca>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-4-git-send-email-jianxin.xiong@intel.com>
 <20201106001303.GL36674@ziepe.ca>
 <MW3PR11MB4555B5ABCE53B195B5EF0AE7E5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555B5ABCE53B195B5EF0AE7E5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 04:20:34PM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Thursday, November 05, 2020 4:13 PM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v8 3/5] RDMA/uverbs: Add uverbs command for dma-buf based MR registration
> > 
> > On Thu, Nov 05, 2020 at 02:48:07PM -0800, Jianxin Xiong wrote:
> > 
> > > +	ret = ib_check_mr_access(access_flags);
> > > +	if (ret)
> > > +		return ret;
> > 
> > This should also reject unsupportable flags like ACCESS_ON_DEMAND and HUGETLB
> 
> Will do.

Just change IB_ACCESS_SUPPORTED to the list of allowed flags in this
context


> > > +	mr->device  = pd->device;
> > > +	mr->pd      = pd;
> > > +	mr->type    = IB_MR_TYPE_USER;
> > > +	mr->uobject = uobj;
> > > +	atomic_inc(&pd->usecnt);
> > 
> > Fix intending when copying code please
> 
> It could be due to a mix of tab and space. They look aligned in the source file. Will fix.

The interior spaces before the = should not be there, we don't align ='s

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
