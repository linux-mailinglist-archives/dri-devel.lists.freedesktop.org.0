Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF7740A675
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 08:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2966E40B;
	Tue, 14 Sep 2021 06:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1965 seconds by postgrey-1.36 at gabe;
 Mon, 13 Sep 2021 18:13:52 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08C6E21D;
 Mon, 13 Sep 2021 18:13:52 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18DGRBUv018538;
 Mon, 13 Sep 2021 13:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/NN3jaUxPuN1Z0XMRm7SAz5tZplp4p3QlUjz9/vCUbc=;
 b=gO39d4TnwFjmc7xxvNJGf0GVcXd02hsuUO1bvxu2ZDiXoKFn2lyr3Ga3IW6qdqZISaoA
 Yzoca+q97jMS2R9VoXLd00SvHsYvqwXbultrFG2N3xEcaVAttzCGwcpb+cQkwr5gDb7W
 ABjjTVYR/z0/F0T1Vd/9CDuHbFL2ryENB/Lfs+9ddrArVMJJ/rg3yCn0Y4xrtZm0tHyi
 zERGOsLVdO76nPD7zFC/GFafhtor/nYWdPr/CVO9EY7Tg6K4llpeViKhOwEFhsVAFQhr
 Jk5UsCkpqrKYCLRDPgt9m0jufcPfVREB+9CHfITC7euvKIWljd90An0qkF4rVVlz/Ffx 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b247749d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 13:41:02 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18DHYb4u002637;
 Mon, 13 Sep 2021 13:41:01 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b247749ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 13:41:01 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18DHNkKQ030419;
 Mon, 13 Sep 2021 17:41:00 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3b0m3a7j57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 17:41:00 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18DHehJp41025848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 17:40:43 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD939124066;
 Mon, 13 Sep 2021 17:40:43 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50577124076;
 Mon, 13 Sep 2021 17:40:36 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.116.76])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Sep 2021 17:40:36 +0000 (GMT)
Message-ID: <1e431e58465b86430d02d429c86c427f7088bf1f.camel@linux.ibm.com>
Subject: Re: [PATCH v2 0/9] Move vfio_ccw to the new mdev API
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, Tony
 Krowiak <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Harald Freudenberger
 <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org, Kirti
 Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org, Matthew
 Rosato <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Date: Mon, 13 Sep 2021 13:40:34 -0400
In-Reply-To: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -Y_Guw0LHcHmxLUcn1T9ujGqJJ8_C5Jd
X-Proofpoint-ORIG-GUID: z1fn5zdhFz8KxePmVCxN-fxKjMKHYvcA
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130063
X-Mailman-Approved-At: Tue, 14 Sep 2021 06:05:43 +0000
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

On Thu, 2021-09-09 at 16:38 -0300, Jason Gunthorpe wrote:
> This addresses Cornelia's remark on the earlier patch that ccw has a
> confusing lifecycle. While it doesn't seem like the original attempt
> was
> functionally wrong, the result can be made better with a lot of
> further
> work.

I thought I'd take a stab at seeing how this works with the hardware
before looking at the code much. git couldn't apply patches 1, 6, or 9
to 5.15-rc1, but I was able to hand-fit them into place. Shutting down
the guest and de-configuring a device ends up bringing my whole system
down. I haven't looked at this any further; hopefully something jumps
to mind for you:

[   64.585347] vfio_ccw 0.0.08fe: MDEV: Unregistering
[   64.585357] illegal operation: 0001 ilc:1 [#1] SMP 
[   64.585362] Modules linked in: vhost_vsock
vmw_vsock_virtio_transport_common vsock vhost
[   64.585364] vfio_ccw_mdev b50bbd4b-eab8-4f8c-9f0c-3cf636f936b9:
Relaying device request to user (#0)
[   64.585364]  vhost_iotlb lcs ctcm fsm kvm xt_MASQUERADE xt_conntrack
ipt_REJECT nf_reject_ipv4 xt_tcpudp iptable_mangle iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_filter bridge stp
llc dm_multipath dm_mod s390_trng eadm_sch zcrypt_cex4 qeth_l2 vfio_ccw
mdev vfio_iommu_type1 vfio configfs zram zsmalloc ip_tables x_tables
mlx5_core ghash_s390 prng aes_s390 des_s390 libdes sha3_512_s390
sha3_256_s390 sha512_s390 sha256_s390 sha1_s390 sha_common pkey zcrypt
rng_core autofs4
[   64.585392] CPU: 14 PID: 4487 Comm: qemu-system-s39 Kdump: loaded
Not tainted 5.15.0-rc1 #1
[   64.585395] Hardware name: IBM 3906 M05 780 (LPAR)
[   64.585396] Krnl PSW : 0704c00180000000 0000000000000002 (0x2)
[   64.585404]            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:0 AS:3 CC:0
PM:0 RI:0 EA:3
[   64.585407] Krnl GPRS: 0000000000000001 0000000000000000
00000000005f4800 0000000000000004
[   64.585410]            0000000000000000 0000000000000002
0000000000000000 000002aa3e65085e
[   64.585412]            000000008de09100 0000000000003b6f
000003ff8017fa08 00000000005f4800
[   64.585413]            0000000081450000 000003ff7c032310
000003ff80179db0 000003800bf53da0
[   64.585418] Krnl Code:#0000000000000000:
0000                illegal 
          >0000000000000002: 0000               illegal 
           0000000000000004: 0000               illegal 
           0000000000000006: 0000               illegal 
           0000000000000008: 0000               illegal 
           000000000000000a: 0000               illegal 
           000000000000000c: 0000               illegal 
           000000000000000e: 0000               illegal 
[   64.585462] Call Trace:
[   64.585464]  [<0000000000000002>] 0x2 
[   64.585467] ([<000003ff80179d74>] vfio_ccw_mdev_ioctl+0x84/0x318
[vfio_ccw])
[   64.585476]  [<00000000bb7adda6>] __s390x_sys_ioctl+0xbe/0x100 
[   64.585481]  [<00000000bbfbf5e4>] __do_syscall+0x1bc/0x1e8 
[   64.585488]  [<00000000bbfcc8d8>] system_call+0x78/0xa0 

Eric

> 
> Reorganize the driver so that the mdev owns the private memory and
> controls the lifecycle, not the css_driver. The memory associated
> with the
> css_driver lifecycle is only the mdev_parent/mdev_type registration.
> 
> Along the way we change when the sch is quiescent or not to be linked
> to
> the open/close_device lifetime of the vfio_device, which is sort of
> what
> it was tring to do already, just not completely.
> 
> The troublesome racey lifecycle of the css_driver callbacks is made
> clear
> with simple vfio_device refcounting so a callback is only delivered
> into a
> registered vfio_device and has obvious correctness.
> 
> Move the only per-css_driver state, the "available instance" counter,
> into
> the core code and share that logic with many of the other drivers.
> The
> value is kept in the mdev_type memory.
> 
> v2:
>  - Clean up the lifecycle in ccw with 7 new patches
>  - Rebase
> v1: 
> https://lore.kernel.org/all/7-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com
> 
> Jason Gunthorpe (9):
>   vfio/ccw: Use functions for alloc/free of the vfio_ccw_private
>   vfio/ccw: Pass vfio_ccw_private not mdev_device to various
> functions
>   vfio/ccw: Convert to use vfio_register_group_dev()
>   vfio/ccw: Make the FSM complete and synchronize it to the mdev
>   vfio/mdev: Consolidate all the device_api sysfs into the core code
>   vfio/mdev: Add mdev available instance checking to the core
>   vfio/ccw: Remove private->mdev
>   vfio: Export vfio_device_try_get()
>   vfio/ccw: Move the lifecycle of the struct vfio_ccw_private to the
>     mdev
> 
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |   9 +-
>  drivers/s390/cio/vfio_ccw_drv.c       | 282 +++++++++++-------------
> --
>  drivers/s390/cio/vfio_ccw_fsm.c       | 152 ++++++++++----
>  drivers/s390/cio/vfio_ccw_ops.c       | 240 ++++++++++------------
>  drivers/s390/cio/vfio_ccw_private.h   |  42 +++-
>  drivers/s390/crypto/vfio_ap_ops.c     |  41 +---
>  drivers/s390/crypto/vfio_ap_private.h |   2 -
>  drivers/vfio/mdev/mdev_core.c         |  13 +-
>  drivers/vfio/mdev/mdev_private.h      |   2 +
>  drivers/vfio/mdev/mdev_sysfs.c        |  64 +++++-
>  drivers/vfio/vfio.c                   |   3 +-
>  include/linux/mdev.h                  |  13 +-
>  include/linux/vfio.h                  |   1 +
>  samples/vfio-mdev/mbochs.c            |   9 +-
>  samples/vfio-mdev/mdpy.c              |  31 +--
>  samples/vfio-mdev/mtty.c              |  10 +-
>  16 files changed, 470 insertions(+), 444 deletions(-)
> 

