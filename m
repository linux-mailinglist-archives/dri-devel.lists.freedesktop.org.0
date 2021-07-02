Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343C3BA041
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 14:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC75D6E159;
	Fri,  2 Jul 2021 12:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8DF6E153;
 Fri,  2 Jul 2021 12:19:31 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162CBPZE017259; Fri, 2 Jul 2021 12:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Bm1Vb4PRIp8lyHUbwdjT462tG7M9FjVHVCCO3OaoUGY=;
 b=ntMosZg45V/25BZpftG9/Gdu4OjAcj02RLNyc4P0hBMNgcPmTYqio/Obcx11s72IrzVg
 vVPXUvnYTEf+lgAKYaCGRD9+1ncnBU5Pk3EAyTeAGgioSj3GcSv05xY2BHvoLHU+SaEx
 QSZo6NwEhrseoQxW4kx9VLoVRXmUG9Q0EXUNDBNT+G037ZK7L0tPsc8aAUO+UgPW1sfj
 zaPo68N8Wk84rLI3XWB1n46OoyaG7AI+sb8LE1a7Tck83gH/Mppdt1QAy2RhFkHnwBPQ
 72hJdeFdPokJU36ctFOjBxznS9OJKhOPfzVPJ3x5/4XA/xS3+6qE/k9oGV9DtbLSIzU1 xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39htf6rt9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 12:19:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 162CAFui124654;
 Fri, 2 Jul 2021 12:19:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 39dt9nrcnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 12:19:21 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 162CJKka152057;
 Fri, 2 Jul 2021 12:19:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 39dt9nrcmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Jul 2021 12:19:20 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 162CJIDh010626;
 Fri, 2 Jul 2021 12:19:18 GMT
Received: from kadam (/102.222.70.252) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Jul 2021 12:19:18 +0000
Date: Fri, 2 Jul 2021 15:19:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-gt-next 8/14]
 drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized
 symbol 'rq'.
Message-ID: <20210702121910.GX1983@kadam>
References: <202107020708.XXwacDfG-lkp@intel.com>
 <CAM0jSHOb0bGWMt-tmUn62R_FpiM5TL2HFLbBqxhpqk1gH0qSUA@mail.gmail.com>
 <20210702110727.GT1983@kadam>
 <CAM0jSHMyXEdS9wgkypKdvW1BNdUgcLxZR8Pd8nxSpPQHtiX+yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0jSHMyXEdS9wgkypKdvW1BNdUgcLxZR8Pd8nxSpPQHtiX+yA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 0_myu9kthiNk5ND7SttQSzaGH3CrbGWf
X-Proofpoint-ORIG-GUID: 0_myu9kthiNk5ND7SttQSzaGH3CrbGWf
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

On Fri, Jul 02, 2021 at 12:34:33PM +0100, Matthew Auld wrote:
> > > > cf586021642d80 Chris Wilson 2021-06-17   85             err = fn(migrate, &ww, src, dst, &rq);
> > > > cf586021642d80 Chris Wilson 2021-06-17   86             if (!err)
> > > > cf586021642d80 Chris Wilson 2021-06-17   87                     continue;
> > > >
> > > > Does fn() initialize "rq" on the success path?  Anyway Smatch would
> > > > complain anyway because it thinks the list could be empty or that we
> > > > might hit and early continue for everything.
> > >
> > > The fn() will always first initialize the rq to NULL. If it returns
> > > success then rq will always be a valid rq. If it returns an err then
> > > the rq might be NULL, or a valid rq depending on how far the copy/fn
> > > got.
> > >
> > > And for_i915_gem_ww() will always run at least once, since ww->loop =
> > > true, so this looks like a false positive?
> >
> > You don't think i915_gem_object_lock(), i915_gem_object_pin_map() or
> > i915_gem_object_pin_map() can fail?
> 
> Yeah, they can totally fail but then we mostly likely just hit the
> err_out. The for_i915_gem_ww() is a little strange since it's not
> really looping over anything, it's just about retrying the block if we
> see -EDEADLK(which involves dropping some locks), if we see any other
> error then the loop is terminated with ww->loop = false, which then
> hits the goto err_out.
> 

Ah, yeah, you're right.  False positive.

I hadn't looked at this code in context (I only had reviewed the email).
Now that I've pulled the tree and looked at the code, then I'm sort of
surprised that Smatch generates a warning...  I will investigate some
more.  Thanks!

regards,
dan carpenter

