Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5941F23B5A0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F646E433;
	Tue,  4 Aug 2020 07:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10BE8828E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 18:27:00 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id i129so2356307vsi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 11:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kP+FsGwT7Ong6g9Z4afLp/eWEQkLU5G56u7wCNQ8PbY=;
 b=AJgTtJOfq33QtwVrHYsaLOFspsbTiqgCrzwxWUY4KSq8nn719n+LK296FDkKFWb8T/
 zvbXOvclUTRqLQF7WTykx9gCeghXvWxet31NMy9+UG+NrC+4/FTyOer5i1CmCmMo0PV1
 yVvi/nIBZZJzUWIh9DtK+klhMtAxhPJ/ulejuNnLSgm60MrsJ2Q90/Typ5lUScJ085mD
 jNUdQOdm/4sVykvl/EH4WQG63v+mYA/ZS0d7HyrbkkRQjRXYZewhg6AiAQGcJcvP7FiZ
 olFj/Vgfz+QhA0pdRP+9yyIHjYV4J8WcoUK+EPB37dwI4LCLmCkX5KRmdpei3BwBnw5p
 +4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kP+FsGwT7Ong6g9Z4afLp/eWEQkLU5G56u7wCNQ8PbY=;
 b=EtqO95HGpzKosH2UcBOkuqotJIH2aVgYArsbAc3RKZYR+wuxVNfF2vxcoYZlTpDSZt
 u9C5/eurcOOT5XV/enaE9k1WrwxkIsrKDBLwe9wWGOBjNBM+/MODUSxLngJVM9Oz+U+G
 A3HBmWQE4GgN/Dar3U8eDOyuJhxbtuGwSss1rLMWn+kL+G53V3XThdGZE26zyOoouxYu
 eDRVzCPEyTpVDum00YnF3XzKTJgJ+fts+BjJHAOhiSzC02I9hTsApGuzvro1DlbTSxS9
 N5Ex90JHxZKq8SqlyV61mStCsF9UgbQXyE9GpPnhypd916V0wZkxlQ3x+DL5eQqxJAv5
 5eNg==
X-Gm-Message-State: AOAM5306or75OgnoiQxGin39CbGMUND3l4iVa5S8Q9/c6NGAGw/u9bF1
 fuNSqEniMycxW+5tKwYcFSCpFQ==
X-Google-Smtp-Source: ABdhPJyU6H1ORSnyrbL6pgwSK5k0t4nkRLWrE1WiAHAQSrIO/HfrXXNuBwmpKt88ZgedOp1BLgmXJw==
X-Received: by 2002:a67:8084:: with SMTP id
 b126mr12585151vsd.163.1596479219744; 
 Mon, 03 Aug 2020 11:26:59 -0700 (PDT)
Received: from google.com (182.71.196.35.bc.googleusercontent.com.
 [35.196.71.182])
 by smtp.gmail.com with ESMTPSA id o3sm1766447vka.42.2020.08.03.11.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 11:26:59 -0700 (PDT)
Date: Mon, 3 Aug 2020 18:26:56 +0000
From: Kalesh Singh <kaleshsingh@google.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/2] fs: Add fd_install file operation
Message-ID: <20200803182656.GA3230172@google.com>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-2-kaleshsingh@google.com>
 <20200803163429.GA15200@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803163429.GA15200@infradead.org>
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: linux-doc@vger.kernel.org, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 Ioannis Ilkos <ilkos@google.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Ingo Molnar <mingo@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 03, 2020 at 05:34:29PM +0100, Christoph Hellwig wrote:
> On Mon, Aug 03, 2020 at 02:47:18PM +0000, Kalesh Singh wrote:
> > Provides a per process hook for the acquisition of file descriptors,
> > despite the method used to obtain the descriptor.
> > 
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> 
> I strongly disagree with this.  The file operation has no business
> hooking into installing the fd.
Hi Christoph. I am exploring the alternative suggested by Matthew in
Patch 2/2. Thanks :)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
