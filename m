Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8444E2F56
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 18:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FA510E34E;
	Mon, 21 Mar 2022 17:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2CB10E34E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 17:45:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8B6C1F381;
 Mon, 21 Mar 2022 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1647884732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peglqrh0TeDc2F8OaZcmUkLDagjJhol7WzzofXyyxO4=;
 b=PnmDb1Bn2lmsEUIPSG3oXSY46IqI6iAnrhkUOd3imYGHhzUBGrywA4Q9uGXh7c/svUPKw5
 ngHuZu78cVggAJKMr47ybLtd326kLSE1NoNSHr9Gfg480gkY2G8m9HV1lQGRPPiKOrSgdz
 U10jIZn2E3ClJ36uP4+4GnMAPYs5WBQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB410139DB;
 Mon, 21 Mar 2022 17:45:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uViIKLu5OGIeUQAAMHmgww
 (envelope-from <mkoutny@suse.com>); Mon, 21 Mar 2022 17:45:31 +0000
Date: Mon, 21 Mar 2022 18:45:30 +0100
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v3 5/8] dmabuf: Add gpu cgroup charge transfer function
Message-ID: <20220321174530.GB9640@blackbody.suse.cz>
References: <20220309165222.2843651-1-tjmercier@google.com>
 <20220309165222.2843651-6-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220309165222.2843651-6-tjmercier@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, linux-media@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello.

On Wed, Mar 09, 2022 at 04:52:15PM +0000, "T.J. Mercier" <tjmercier@google.com> wrote:
> +int dma_buf_charge_transfer(struct dma_buf *dmabuf, struct gpucg *gpucg)
> +{
> +#ifdef CONFIG_CGROUP_GPU
> +	struct gpucg *current_gpucg;
> +	int ret = 0;
> +
> +	/*
> +	 * Verify that the cgroup of the process requesting the transfer is the
> +	 * same as the one the buffer is currently charged to.
> +	 */
> +	current_gpucg = gpucg_get(current);
> +	mutex_lock(&dmabuf->lock);
> +	if (current_gpucg != dmabuf->gpucg) {
> +		ret = -EPERM;
> +		goto err;
> +	}

Add a shortcut for gpucg == current_gpucg?

> +
> +	ret = gpucg_try_charge(gpucg, dmabuf->gpucg_dev, dmabuf->size);
> +	if (ret)
> +		goto err;
> +
> +	dmabuf->gpucg = gpucg;
> +
> +	/* uncharge the buffer from the cgroup it's currently charged to. */
> +	gpucg_uncharge(current_gpucg, dmabuf->gpucg_dev, dmabuf->size);

I think gpucg_* API would need to cater for such transfers too since
possibly transitional breach of a limit during the transfer may
unnecessarily fail the operation.

My 0.02€,
Michal
