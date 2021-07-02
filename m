Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634323B9F79
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E376E102;
	Fri,  2 Jul 2021 11:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F406E102;
 Fri,  2 Jul 2021 11:07:50 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162B7MfW001356; Fri, 2 Jul 2021 11:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UQX0HmhakfTua3ejy0UEZtpEwZTjewy2dJJ4JR+s91E=;
 b=N4hLvd6ejZDweLBwYRXRmEVdmReC7dFP5KzfhRh40lFq3EmmKAOS6LoIaNpOzeoM777u
 Q/ady2sUr7vd+EQg7S8Q0ToO6BXT69V3Pg9TgYG0cR7mBPVaFM2VKf7rsaKx0Muoty0K
 WsRftSivnfvuOzZG/TlMeILsmuDqyyb20ebExh8wAAffPIZuPyHQV50h26FJwQdHNXtI
 a/Erk/5eXcllpBN42bpr5DLPS/UUu2FBdfHDFf7/BkPGB6nuh10wcrl2QNbYeMInisJ5
 nl0d+pI+O5NnQGG6+LmMNaIL5ghreTFfpVLgjCd5vwHCDrNXcgSttbFLSqGz286Sa1XE ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39htf6rpnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 11:07:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 162B02B4160175;
 Fri, 2 Jul 2021 11:07:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 39dv2cgm5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 11:07:40 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 162B7ddQ179844;
 Fri, 2 Jul 2021 11:07:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 39dv2cgm52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 11:07:39 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 162B7aSg029379;
 Fri, 2 Jul 2021 11:07:36 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Jul 2021 11:07:36 +0000
Date: Fri, 2 Jul 2021 14:07:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-gt-next 8/14]
 drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized
 symbol 'rq'.
Message-ID: <20210702110727.GT1983@kadam>
References: <202107020708.XXwacDfG-lkp@intel.com>
 <CAM0jSHOb0bGWMt-tmUn62R_FpiM5TL2HFLbBqxhpqk1gH0qSUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0jSHOb0bGWMt-tmUn62R_FpiM5TL2HFLbBqxhpqk1gH0qSUA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: anyABc66Belfp7Og-r667Xx0eFR1RXiT
X-Proofpoint-ORIG-GUID: anyABc66Belfp7Og-r667Xx0eFR1RXiT
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, kbuild@lists.01.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 11:32:45AM +0100, Matthew Auld wrote:
> On Fri, 2 Jul 2021 at 09:45, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
> > head:   5cd57f676bb946a00275408f0dd0d75dbc466d25
> > commit: cf586021642d8017cde111b7dd1ba86224e9da51 [8/14] drm/i915/gt: Pipelined page migration
> > config: x86_64-randconfig-m001-20210630 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New smatch warnings:
> > drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized symbol 'rq'.
> > drivers/gpu/drm/i915/gt/selftest_migrate.c:113 copy() error: uninitialized symbol 'vaddr'.
> >
> > Old smatch warnings:
> > drivers/gpu/drm/i915/gem/i915_gem_object.h:182 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 171)
> >
> > vim +/rq +102 drivers/gpu/drm/i915/gt/selftest_migrate.c
> >
> > cf586021642d80 Chris Wilson 2021-06-17   32  static int copy(struct intel_migrate *migrate,
> > cf586021642d80 Chris Wilson 2021-06-17   33             int (*fn)(struct intel_migrate *migrate,
> > cf586021642d80 Chris Wilson 2021-06-17   34                       struct i915_gem_ww_ctx *ww,
> > cf586021642d80 Chris Wilson 2021-06-17   35                       struct drm_i915_gem_object *src,
> > cf586021642d80 Chris Wilson 2021-06-17   36                       struct drm_i915_gem_object *dst,
> > cf586021642d80 Chris Wilson 2021-06-17   37                       struct i915_request **out),
> > cf586021642d80 Chris Wilson 2021-06-17   38             u32 sz, struct rnd_state *prng)
> > cf586021642d80 Chris Wilson 2021-06-17   39  {
> > cf586021642d80 Chris Wilson 2021-06-17   40     struct drm_i915_private *i915 = migrate->context->engine->i915;
> > cf586021642d80 Chris Wilson 2021-06-17   41     struct drm_i915_gem_object *src, *dst;
> > cf586021642d80 Chris Wilson 2021-06-17   42     struct i915_request *rq;
> > cf586021642d80 Chris Wilson 2021-06-17   43     struct i915_gem_ww_ctx ww;
> > cf586021642d80 Chris Wilson 2021-06-17   44     u32 *vaddr;
> > cf586021642d80 Chris Wilson 2021-06-17   45     int err = 0;
> >
> > One way to silence these warnings would be to initialize err = -EINVAL.
> > Then Smatch would know that we goto err_out for an empty list.
> >
> > cf586021642d80 Chris Wilson 2021-06-17   46     int i;
> > cf586021642d80 Chris Wilson 2021-06-17   47
> > cf586021642d80 Chris Wilson 2021-06-17   48     src = create_lmem_or_internal(i915, sz);
> > cf586021642d80 Chris Wilson 2021-06-17   49     if (IS_ERR(src))
> > cf586021642d80 Chris Wilson 2021-06-17   50             return 0;
> > cf586021642d80 Chris Wilson 2021-06-17   51
> > cf586021642d80 Chris Wilson 2021-06-17   52     dst = i915_gem_object_create_internal(i915, sz);
> > cf586021642d80 Chris Wilson 2021-06-17   53     if (IS_ERR(dst))
> > cf586021642d80 Chris Wilson 2021-06-17   54             goto err_free_src;
> > cf586021642d80 Chris Wilson 2021-06-17   55
> > cf586021642d80 Chris Wilson 2021-06-17   56     for_i915_gem_ww(&ww, err, true) {
> > cf586021642d80 Chris Wilson 2021-06-17   57             err = i915_gem_object_lock(src, &ww);
> > cf586021642d80 Chris Wilson 2021-06-17   58             if (err)
> > cf586021642d80 Chris Wilson 2021-06-17   59                     continue;
> > cf586021642d80 Chris Wilson 2021-06-17   60
> > cf586021642d80 Chris Wilson 2021-06-17   61             err = i915_gem_object_lock(dst, &ww);
> > cf586021642d80 Chris Wilson 2021-06-17   62             if (err)
> > cf586021642d80 Chris Wilson 2021-06-17   63                     continue;
> > cf586021642d80 Chris Wilson 2021-06-17   64
> > cf586021642d80 Chris Wilson 2021-06-17   65             vaddr = i915_gem_object_pin_map(src, I915_MAP_WC);
> > cf586021642d80 Chris Wilson 2021-06-17   66             if (IS_ERR(vaddr)) {
> > cf586021642d80 Chris Wilson 2021-06-17   67                     err = PTR_ERR(vaddr);
> > cf586021642d80 Chris Wilson 2021-06-17   68                     continue;
> > cf586021642d80 Chris Wilson 2021-06-17   69             }
> > cf586021642d80 Chris Wilson 2021-06-17   70
> > cf586021642d80 Chris Wilson 2021-06-17   71             for (i = 0; i < sz / sizeof(u32); i++)
> > cf586021642d80 Chris Wilson 2021-06-17   72                     vaddr[i] = i;
> > cf586021642d80 Chris Wilson 2021-06-17   73             i915_gem_object_flush_map(src);
> > cf586021642d80 Chris Wilson 2021-06-17   74
> > cf586021642d80 Chris Wilson 2021-06-17   75             vaddr = i915_gem_object_pin_map(dst, I915_MAP_WC);
> > cf586021642d80 Chris Wilson 2021-06-17   76             if (IS_ERR(vaddr)) {
> > cf586021642d80 Chris Wilson 2021-06-17   77                     err = PTR_ERR(vaddr);
> > cf586021642d80 Chris Wilson 2021-06-17   78                     goto unpin_src;
> > cf586021642d80 Chris Wilson 2021-06-17   79             }
> > cf586021642d80 Chris Wilson 2021-06-17   80
> > cf586021642d80 Chris Wilson 2021-06-17   81             for (i = 0; i < sz / sizeof(u32); i++)
> > cf586021642d80 Chris Wilson 2021-06-17   82                     vaddr[i] = ~i;
> > cf586021642d80 Chris Wilson 2021-06-17   83             i915_gem_object_flush_map(dst);
> > cf586021642d80 Chris Wilson 2021-06-17   84
> > cf586021642d80 Chris Wilson 2021-06-17   85             err = fn(migrate, &ww, src, dst, &rq);
> > cf586021642d80 Chris Wilson 2021-06-17   86             if (!err)
> > cf586021642d80 Chris Wilson 2021-06-17   87                     continue;
> >
> > Does fn() initialize "rq" on the success path?  Anyway Smatch would
> > complain anyway because it thinks the list could be empty or that we
> > might hit and early continue for everything.
> 
> The fn() will always first initialize the rq to NULL. If it returns
> success then rq will always be a valid rq. If it returns an err then
> the rq might be NULL, or a valid rq depending on how far the copy/fn
> got.
> 
> And for_i915_gem_ww() will always run at least once, since ww->loop =
> true, so this looks like a false positive?

You don't think i915_gem_object_lock(), i915_gem_object_pin_map() or
i915_gem_object_pin_map() can fail?

regards,
dan carpenter

