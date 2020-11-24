Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A42C3A8B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D686E83C;
	Wed, 25 Nov 2020 08:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAA788E5B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 15:36:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f93so16308324qtb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 07:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xNaOFZNkwIGLApccOCjDLA4YSGm/yJphGbkVVvGvuwc=;
 b=nYM1s/aEC7ketvEn+DvgsffZmebE/9oCDHo8TAGmuqttbt0zqBFo/IAPVBEEWomCau
 kgUCw9Qh4S/lXIJLB+kNynMmrrr8JM6GVVBXhQfje2Q8HwwTqbxkOho4UhpjeQtUEsR2
 nEoOJarSDCmbsIfP0uQbDPIlfu8wjZENG+By6Sbeg5IV9Wh+hQAsUr96TueJ7Y6Vg8bD
 Bmc0oh+hY1urBPTxmCFqXLHc0g/0OWaFRTu9TVRFqfnyzITLi48P8pBMAw7OiaVigW44
 nX9u7sUbVbtQf1tcl3uwbaoAFYfatjfTncwYBS5RlTu1vq0Psw6m5XRAGbuS8sQe3qwK
 xXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xNaOFZNkwIGLApccOCjDLA4YSGm/yJphGbkVVvGvuwc=;
 b=R2jh4Eq66GlhsHVrt4/y8y4UfHd+C1QFUDA2mwTWYfY+dq+NllOeQkefauwHNfAKMA
 C8VlS6Y0S8knPycvkvXNpNdkhjlsyCSZPNybe0eyjItcQMS1dx/iffeDXyK1g0Fmnn63
 ZBmNC/NZIIaC4nfvzIjXUHmc5hTwzOqGzy77u1wz8PQ2+0q7ydysAEXekupwGHk8ZiK2
 HFbYw+WCeGZxpg4uSvk6lGqqnK2abW3Ys3deoPKkHhV2f4DHxIHE/6zffcMvij9Ii/Jo
 hgsSLeueItfbQ03WujHIUFoFSUy56O8MZfSPQk/iI9pcjcQEVaW7ut5/mB56F25Qpz4l
 eVmg==
X-Gm-Message-State: AOAM5311tnC8Xi1TIxzaDY3xVPijQ6L6xL8s/AN9qdEcRU1sDGyOGO7A
 ecFYSOEE4Do6BvyTnFrVhY37yA==
X-Google-Smtp-Source: ABdhPJw9HZW4/QIXyw3Wu2qQDbZWFOnMRP1dRTF4t43+gQon0h6DcDtwNVHgJibn/lihniJm8HNCAw==
X-Received: by 2002:ac8:714e:: with SMTP id h14mr4890325qtp.301.1606232188461; 
 Tue, 24 Nov 2020 07:36:28 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id q20sm12653025qtn.80.2020.11.24.07.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 07:36:27 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1khaMk-000oqd-MW; Tue, 24 Nov 2020 11:36:26 -0400
Date: Tue, 24 Nov 2020 11:36:26 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Message-ID: <20201124153626.GG5487@ziepe.ca>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
 <20201123180504.GA244516@ziepe.ca>
 <20201124151658.GT401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124151658.GT401619@phenom.ffwll.local>
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 04:16:58PM +0100, Daniel Vetter wrote:

> Compute is the worst, because opencl is widely considered a mistake (maybe
> opencl 3 is better, but nvidia is stuck on 1.2). The actually used stuff is
> cuda (nvidia-only), rocm (amd-only) and now with intel also playing we
> have xe (intel-only).

> It's pretty glorious :-/

I enjoyed how the Intel version of CUDA is called "OneAPI" not "Third
API" ;)

Hopefuly xe compute won't leave a lot of half finished abandoned
kernel code like Xeon Phi did :(

> Also I think we discussed this already, but for actual p2p the intel
> patches aren't in upstream yet. We have some internally, but with very
> broken locking (in the process of getting fixed up, but it's taking time).

Someone needs to say this test works on a real system with an
unpatched upstream driver.

I thought AMD had the needed parts merged?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
