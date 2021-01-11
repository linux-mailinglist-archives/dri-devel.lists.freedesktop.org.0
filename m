Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95902F297D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9E6E0DD;
	Tue, 12 Jan 2021 07:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BA76E103
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 15:42:47 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id d11so7539692qvo.11
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 07:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/A3K81mCc2dS4hJrTjzDKAgCNXohBPbNHXt40jMVfBE=;
 b=CXrZBuSkG8rRms3ZL3rzrzAOF3aLMpWdW69IPOtx//RbSUIhNTMwQ9FMK2nCPInD+D
 ZX6cGJzj5moC8jlrzTKKUXTa+JR/s9PdGesy9OId/yTn+wN2+ciOgS20FwZdZnOo8DHI
 DDQuWmu5xvEtMw8CoTvnYScPHMK+9GCQG3WIAmdmvpnqLHvMHDjdfCtQvFm4aHNt2yQA
 +AWVRQ5CFmmaTTXp5IiZFgYht1+EQbPJB228B4YDjoUBWtsDZ22ZUCFOK0BzORdcm2Cq
 hw6V2zIS8PGacVXd9RLe4Zr7FiYVQX9y/qDTs8XlKHfiSfVcTLLIiZXTapof2a/I/qOi
 8/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/A3K81mCc2dS4hJrTjzDKAgCNXohBPbNHXt40jMVfBE=;
 b=LBu1TiBud6WWTWjruqdjae4ZmgE4OavU4vxdsmIQ72AUG9h+bz/BFutOF76KKxZ+Bq
 5J/bGW15HrQpRjf6x+J/b1mqgj0XXZRoGj53LdghT3+oBeTJa7wwHS5mM42SQMrE7UQQ
 YFeOjXVUa1VYfXv+ulTvc6pUIcEg/h7IodzE6pLFXTQLPAlWZt9TGUwng7AdMT5xmKJF
 A5dervAeON1zjpu1sTN657kV21F8goBogj9vEoYWhT8UrgMl9sTO+xK1xtbkuO70DJBe
 fwHkSRXNlg85bsrwJ3/E+NTh+yLsQCa4o+i4WxK3vls9VIWOL0e55yxbcEXxF/axBhm5
 UcsA==
X-Gm-Message-State: AOAM533Tq5FUzsSf+qmo43YS39hs+jPLqfFCtFjLmdIHBUbhumyHhVQH
 ElwX37L3amkfRiYSZOrj9Fqfrw==
X-Google-Smtp-Source: ABdhPJyqWR0zrhRhfIJaiKsvRsyRi99Jl6vsxixvOPVy/qex98L1qLKA8+KCmL3Ov+yPPxwU0W5tvA==
X-Received: by 2002:a05:6214:1103:: with SMTP id
 e3mr262417qvs.12.1610379766360; 
 Mon, 11 Jan 2021 07:42:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id f10sm8111748qtg.27.2021.01.11.07.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:42:45 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kyzLB-005Xz6-9o; Mon, 11 Jan 2021 11:42:45 -0400
Date: Mon, 11 Jan 2021 11:42:45 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
Message-ID: <20210111154245.GL504133@ziepe.ca>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555CCCDD42F1ADEC61F7ACAE5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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

On Mon, Jan 11, 2021 at 03:24:18PM +0000, Xiong, Jianxin wrote:
> Jason, will this series be able to get into 5.12?

I was going to ask you where things are after the break? 

Did everyone agree the userspace stuff is OK now? Is Edward OK with
the pyverbs changes, etc

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
