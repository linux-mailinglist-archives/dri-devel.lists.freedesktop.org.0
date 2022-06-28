Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA555EB67
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 19:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FE8113667;
	Tue, 28 Jun 2022 17:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43AB11B495
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 17:54:59 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 c6-20020a17090abf0600b001eee794a478so6039840pjs.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ifakbg1KSXljeCc2KlqlOz+XfzIBohlTVCEx+b5hm2Y=;
 b=Lpc3rw2lUDFTgNuiFkNi7vJ3FOoQQ8sPNV+A/xT7kPgFFi5TelrrdXlIUbrL4j9GT+
 3+ei8DuymmFwmq4TMtVSFXVwj/BEoFuIu2AqPN9i6R5zOS+ndUs4OIvpg1Fj2tZP3rAs
 mZTqNdFC15vlNUFmjWu7inrraPu1BA3Mkzqts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ifakbg1KSXljeCc2KlqlOz+XfzIBohlTVCEx+b5hm2Y=;
 b=Bz6q2aOs55VSA4rR9ftGKwcSjaklXM0rQ8KR3nbfNnU/S+czI2viugtVrRTpfRyh4R
 XTtuFQv+QJqfK48RX+y5lPeg8cYjGLXJbkNLfVFtUggyUdbkDUls5nbkqPJd3FSsxoxr
 VNahQImPlps40KhCcqt/2WOIN2p0P1BNy17cEhaoJ7DS6N80xT4xyV7RO/QYhrp6DlIc
 cGJil3Az1M16I2L2Cv/YCm7UKZ9ekZm++yrNtoyQ8F4nppnRM+7mdLx1qRNC6P0aONSh
 Y6yeZ/s6m1I2sFYlSC3h1MU0T0cDMFWgG3BrGAeIYayrbIr9js1UTPBOMeGBzzCEPIQm
 eU2g==
X-Gm-Message-State: AJIora9duzeIynlOXu5AKl0Sx43ZFq6H+gwNy3JBB8uCPR23wCRALgug
 rJ2rwecOLiOWwgshP0va71jxzw==
X-Google-Smtp-Source: AGRyM1vNNODoy68cNcew+BOwykVJS5AyiEbndqdKVVh3DpwTH+wUBJ1HcGxnO6zSsyx2Hva19xbd8w==
X-Received: by 2002:a17:90b:3b52:b0:1ec:db2a:b946 with SMTP id
 ot18-20020a17090b3b5200b001ecdb2ab946mr838564pjb.229.1656438899502; 
 Tue, 28 Jun 2022 10:54:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902ff0f00b0016a84d232a6sm5432810plj.46.2022.06.28.10.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 10:54:59 -0700 (PDT)
Date: Tue, 28 Jun 2022 10:54:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <202206281009.4332AA33@keescook>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628004052.GM23621@ziepe.ca>
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
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org,
 x86@kernel.org, kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, v9fs-developer@lists.sourceforge.net,
 linux-mips@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, virtualization@lists.linux-foundation.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 27, 2022 at 09:40:52PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 27, 2022 at 08:27:37PM +0200, Daniel Borkmann wrote:
> > [...]
> > Fyi, this breaks BPF CI:
> > 
> > https://github.com/kernel-patches/bpf/runs/7078719372?check_suite_focus=true
> > 
> >   [...]
> >   progs/map_ptr_kern.c:314:26: error: field 'trie_key' with variable sized type 'struct bpf_lpm_trie_key' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >           struct bpf_lpm_trie_key trie_key;
> >                                   ^

The issue here seems to be a collision between "unknown array size"
and known sizes:

struct bpf_lpm_trie_key {
        __u32   prefixlen;      /* up to 32 for AF_INET, 128 for AF_INET6 */
        __u8    data[0];        /* Arbitrary size */
};

struct lpm_key {
	struct bpf_lpm_trie_key trie_key;
	__u32 data;
};

This is treating trie_key as a header, which it's not: it's a complete
structure. :)

Perhaps:

struct lpm_key {
        __u32 prefixlen;
        __u32 data;
};

I don't see anything else trying to include bpf_lpm_trie_key.

> 
> This will break the rdma-core userspace as well, with a similar
> error:
> 
> /usr/bin/clang-13 -DVERBS_DEBUG -Dibverbs_EXPORTS -Iinclude -I/usr/include/libnl3 -I/usr/include/drm -g -O2 -fdebug-prefix-map=/__w/1/s=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -Wmissing-prototypes -Wmissing-declarations -Wwrite-strings -Wformat=2 -Wcast-function-type -Wformat-nonliteral -Wdate-time -Wnested-externs -Wshadow -Wstrict-prototypes -Wold-style-definition -Werror -Wredundant-decls -g -fPIC   -std=gnu11 -MD -MT libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o -MF libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o.d -o libibverbs/CMakeFiles/ibverbs.dir/cmd_flow.c.o   -c ../libibverbs/cmd_flow.c
> In file included from ../libibverbs/cmd_flow.c:33:
> In file included from include/infiniband/cmd_write.h:36:
> In file included from include/infiniband/cmd_ioctl.h:41:
> In file included from include/infiniband/verbs.h:48:
> In file included from include/infiniband/verbs_api.h:66:
> In file included from include/infiniband/ib_user_ioctl_verbs.h:38:
> include/rdma/ib_user_verbs.h:436:34: error: field 'base' with variable sized type 'struct ib_uverbs_create_cq_resp' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>         struct ib_uverbs_create_cq_resp base;
>                                         ^
> include/rdma/ib_user_verbs.h:644:34: error: field 'base' with variable sized type 'struct ib_uverbs_create_qp_resp' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>         struct ib_uverbs_create_qp_resp base;

This looks very similar, a struct of unknown size is being treated as a
header struct:

struct ib_uverbs_create_cq_resp {
        __u32 cq_handle;
        __u32 cqe;
        __aligned_u64 driver_data[0];
};

struct ib_uverbs_ex_create_cq_resp {
        struct ib_uverbs_create_cq_resp base;
        __u32 comp_mask;
        __u32 response_length;
};

And it only gets used here:

                DECLARE_UVERBS_WRITE(IB_USER_VERBS_CMD_CREATE_CQ,
                                     ib_uverbs_create_cq,
                                     UAPI_DEF_WRITE_UDATA_IO(
                                             struct ib_uverbs_create_cq,
                                             struct ib_uverbs_create_cq_resp),
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                     UAPI_DEF_METHOD_NEEDS_FN(create_cq)),

which must also be assuming it's a header. So probably better to just
drop the driver_data field? I don't see anything using it (that I can
find) besides as a sanity-check that the field exists and is at the end
of the struct.

-- 
Kees Cook
