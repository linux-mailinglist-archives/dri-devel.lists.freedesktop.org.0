Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457A352E683
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A84C11B736;
	Fri, 20 May 2022 07:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC311B736
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 07:47:27 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 z7-20020a17090abd8700b001df78c7c209so10805389pjr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 00:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=56ihVfI55g+5kWoCWi0j9KBKpP7u+QiASGOdishgsYU=;
 b=fI4qwgrFQO4hVvdc3SUyQ8Cdgd+sywkDfLxoX5FB2E66Rov05yQTZSVOzP7gpoXEQF
 0elvCO46fIFZh0PGVYSb0zBP9E8rthiYU1kAunjlGADxZHVDIzKAD9lkoRKg2HXJ1W5y
 hXlwhv/t9DEN5z9vOFJjkOJHZlgbiKv1kt3tICg8ZW4m3WO5jv6iWCSmP7K1aB7qLYm4
 VMIP2whsDbn6dmzkcOergoPPDPGfcjXLPaXh/y5sNGVVKXZAO8zLhLtKDQfFcopimuD1
 iFzKXGu0GYsL7i2AAdYko6ymJb3ROx8/6svDCApNBiO36LmQDMIJe2JZDgJ2TmbOdK9q
 Eg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=56ihVfI55g+5kWoCWi0j9KBKpP7u+QiASGOdishgsYU=;
 b=5Q0J8htoTgVvU4Z/C/0a6H7vE7pfffHfDdaoZJtxW+piC0yvtLQO3/GCgOME6UHVJZ
 GQ0b9Jp3Nvei40XRVTYxm6qi2/D5B0mhOvMh+/zn/wtlCNxxT0BD6OJ8DbY93nsmjERZ
 wFee0X04oa9+A4IVqAIcl+/MRjcM1GPyxssR4Gq6hBOrNPAyLWFi5jWyHyUEISzEmSdc
 8oWFmGyBBZcF9J2bqBeoW4KCgr0wkl7k06nESO2QhtUWHAuCHquFk3K0FHV+l48fwHpG
 I6YClsYzWVr7H++P4yjNDjDMwdFuEQxxcHJ8hoNy2udNt2tEBOMtDpSpDTj2JzNPlmFy
 mS6w==
X-Gm-Message-State: AOAM533oiRi73TMrbMXnrPz7iTVY7GyyfqTGQDrcqdlgItNjluCONW3K
 dqWYLxvYQB4wbVLxfZelBA0=
X-Google-Smtp-Source: ABdhPJzWP/OizPFgR9KmuaPsRGfMHikuqC99X6s0BZZQYR12Xiw5I0XneB0xM48YDFHIVgUBpKEfiw==
X-Received: by 2002:a17:90a:760d:b0:1df:6423:d0b9 with SMTP id
 s13-20020a17090a760d00b001df6423d0b9mr10201911pjk.33.1653032846949; 
 Fri, 20 May 2022 00:47:26 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::4:1761])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a17090331cc00b0015e8d4eb1ebsm4949822ple.53.2022.05.20.00.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 00:47:26 -0700 (PDT)
Date: Thu, 19 May 2022 21:47:25 -1000
From: Tejun Heo <tj@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v7 0/6] Proposal for a GPU cgroup controller
Message-ID: <YodHjYlMx1XGtM2+@slm.duckdns.org>
References: <20220510235653.933868-1-tjmercier@google.com>
 <3365cd1d750e84fedc8e75d646a77ffd85619d35.camel@ndufresne.ca>
 <CABdmKX3ZV6-u-oLvW_wWavAMBfrsZ=C_rCgK_Uz4VjxcRvRFew@mail.gmail.com>
 <81026ef07c1ce20f8673b75b17bab79a2b39c548.camel@ndufresne.ca>
 <CABdmKX2LxZ6zZR=fhXfnuWCB2BR+gzDd1-t1DD2A2XP24wvuGQ@mail.gmail.com>
 <Yn6DpUsoSz1/15Kc@slm.duckdns.org>
 <CABdmKX1xvm87WMEDkMc9Aye46E4zv1-scenwgaRxHesrOCsaYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABdmKX1xvm87WMEDkMc9Aye46E4zv1-scenwgaRxHesrOCsaYg@mail.gmail.com>
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Carlos Llamas <cmllamas@google.com>, dri-devel@lists.freedesktop.org,
 John Stultz <jstultz@google.com>, Zefan Li <lizefan.x@bytedance.com>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kenny.Ho@amd.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Laura Abbott <labbott@redhat.com>,
 kernel-team@android.com, linux-media@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, linaro-mm-sig@lists.linaro.org,
 Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Tue, May 17, 2022 at 04:30:29PM -0700, T.J. Mercier wrote:
> Thanks for your suggestion. This almost works. "dmabuf" as a key could
> work, but I'd actually like to account for each heap. Since heaps can
> be dynamically added, I can't accommodate every potential heap name by
> hardcoding registrations in the misc controller.

On its own, that's a pretty weak reason to be adding a separate gpu
controller especially given that it doesn't really seem to be one with
proper abstractions for gpu resources. We don't want to keep adding random
keys to misc controller but can definitely add limited flexibility. What
kind of keys do you need?

Thanks.

-- 
tejun
