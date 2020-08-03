Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596F23B5B0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05F16E43C;
	Tue,  4 Aug 2020 07:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4E96E0A0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 15:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SnvD0ufrD36AznQ4b9NY+YAqMLCruaCYki+qndIchpQ=; b=rtfARZGfVzm85Mw0LPAVdMHYcI
 8au74Pe9pnWPbe4ilvolD/X3pCAbm3FZNm/Ooq2L3E1dCUsDj3fWTY6kM9qBeIXzh/BpsoJ/KbqBu
 iOqW07bf8Eom8J/hr99iQ2fc8tA+ZNmMYYG9NoLz1Ks2nIWgjL7BMRVcEWN3VIAEM0KCuNMxQo20G
 yu8QmmQhhPJ2sd03rvaywP+ehPid/5brcexjUmluLab3IZ1jyVHjqGnBrhS9NQMk0yK/dMdlgEeCR
 kQR4ab7/IVu4ZZ8muUCcSyl1/0QaMPgP1JmvJvQmA6kdPzCrsRjFo25GiVsOE0KEQ3oKWQ0CKPXU/
 K+Ta2iRQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1k2cab-0007Dl-Uy; Mon, 03 Aug 2020 15:41:26 +0000
Date: Mon, 3 Aug 2020 16:41:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
Message-ID: <20200803154125.GA23808@casper.infradead.org>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803144719.3184138-3-kaleshsingh@google.com>
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

On Mon, Aug 03, 2020 at 02:47:19PM +0000, Kalesh Singh wrote:
> +static void dma_buf_fd_install(int fd, struct file *filp)
> +{
> +	trace_dma_buf_fd_ref_inc(current, filp);
> +}

You're adding a new file_operation in order to just add a new tracepoint?
NACK.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
