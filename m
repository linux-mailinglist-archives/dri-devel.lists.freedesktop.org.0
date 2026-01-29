Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMp4F4yie2nOGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 19:10:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED6B3680
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 19:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52E10E8AA;
	Thu, 29 Jan 2026 18:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com
 [216.40.44.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C64310E012
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 18:10:14 +0000 (UTC)
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id D15A51B05DA;
 Thu, 29 Jan 2026 18:10:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf06.hostedemail.com (Postfix) with ESMTPA id C96662000E; 
 Thu, 29 Jan 2026 18:10:09 +0000 (UTC)
Date: Thu, 29 Jan 2026 13:10:22 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, mhiramat@kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 dhowells@redhat.com, kuba@kernel.org, brauner@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, gaoxiang17
 <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v13] dma-buf: add some tracepoints to debug.
Message-ID: <20260129131022.302e0a6c@gandalf.local.home>
In-Reply-To: <20260109115411.115270-1-gxxa03070307@gmail.com>
References: <7e126504-1966-4c63-8db5-dfe57e206169@amd.com/>
 <20260109115411.115270-1-gxxa03070307@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 7zxw1f8qpegmfp89wafbiq7cbue3tx3c
X-Spam-Status: No, score=-0.10
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Bq6Shjs13wZTE8qaBJ3dI8UFmbrVZV+Q=
X-HE-Tag: 1769710209-415785
X-HE-Meta: U2FsdGVkX19na61YaDkoNKEtYADwBcTU22ie7xg0+6jtjYMWTEj+0HfSETh5E6FW7V/dUnoQr6B2GoQ27355AalL21SUT5I4KyVrEeq0aCFN3DUsniKBxg+ZYoXqX5n+D1yY+u+J1X2qayRCMTZ3nzwQ2+c4gcpn/dSquzu4kMwtamm41DZpB0vAFmE6rmgsMqoN5Azo045IzRzhr7kJBxJ9QF4efvA+Nl94T8N22cKL5MHkQrDIKMq3wEG/Q3FQdbM4aln03CI8d9JjUXsjHKqgCxmNsMyoyx/gRhb2aWiazHibIca3gJzpFfOpqVH7nDfXPCmkb2K6W+WLZJkKX2zhsliT9wCOd8ms9Kw55ZSCueM3qhV3MfrZrv7RbKg6Sm7XviNnT4grRqRPN1bsmKGis+wDRK0RUgGeIypsQ2k=
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gxxa03070307@gmail.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:mhiramat@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mathieu.desnoyers@efficios.com,m:dhowells@redhat.com,m:kuba@kernel.org,m:brauner@kernel.org,m:akpm@linux-foundation.org,m:linux-trace-kernel@vger.kernel.org,m:gaoxiang17@xiaomi.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[rostedt@goodmis.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,goodmis.org:email,xiaomi.com:email,gandalf.local.home:mid]
X-Rspamd-Queue-Id: E0ED6B3680
X-Rspamd-Action: no action

On Fri,  9 Jan 2026 19:54:11 +0800
Xiang Gao <gxxa03070307@gmail.com> wrote:

> From: gaoxiang17 <gaoxiang17@xiaomi.com>
> 
> Since we can only inspect dmabuf by iterating over process FDs or the
> dmabuf_list, we need to add our own tracepoints to track its status in
> real time in production.
> 
> For example:
>    binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_name=qcom,system size=12685312 ino=2738
>    binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=qcom,system size=12685312 ino=2738 fd=8
>    binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_internal: exp_name=qcom,system size=28672 ino=2739
>      kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_name=qcom,system size=12685312 ino=2738
>     RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_name=qcom,system size=12771328 ino=2762 fd=176
>     RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_attach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
>     RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_name=qcom,system size=12771328 ino=2762 attachment:ffffff880a18dd00 is_dynamic=0 dev_name=kgsl-3d0
> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>

This may already been accepted but just for the record. For the tracing POV:

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
