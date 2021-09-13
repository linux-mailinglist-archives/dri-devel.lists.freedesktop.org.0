Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E417440A676
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 08:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA1E6E40C;
	Tue, 14 Sep 2021 06:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D05A6E249;
 Mon, 13 Sep 2021 20:32:08 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18DIxULk018537;
 Mon, 13 Sep 2021 16:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yBRQSXYa6E0Da+LOl4wVPZbAFonIeAlEysP3yqC0kzY=;
 b=iyRyMymH7QfKN3srOByUI7wHO00B6QMgqGhD3OT/yH2ZdLiVFkZuDXvI7Pd+rcXSldW1
 PJbbcCsrGoliN+CVb/3xICZwMwxMIfx1agtSUZMylE/A7xAjsVqC513ZKefVaxA+aMqc
 q2QD5lLwtuSf/cZZ1fEm9e0OO6tHoTby2LcihbT07yVhfLVz/lBWGdeu3sD2/UdKaIFi
 g+QQYblvKFm4t0VM6fv+9iGAvxwCLtgYNLEd/kPKqedxkWJhH8cgWZXzC+XErQw4V8ea
 rRK9mNHhnNyFnPjqu+okcZQAuSDIjqwynBwF0ZCP5bOow07lMkpk/wQDtvbqqS5wDzU9 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b24777ndw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 16:32:05 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18DIospt026987;
 Mon, 13 Sep 2021 16:32:04 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b24777ndh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 16:32:04 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18DKDMSq030005;
 Mon, 13 Sep 2021 20:32:03 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3b0m3a9b8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 20:32:03 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18DKW2Bn44237072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Sep 2021 20:32:02 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42C442805C;
 Mon, 13 Sep 2021 20:32:02 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E31B2805A;
 Mon, 13 Sep 2021 20:31:55 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.116.76])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Sep 2021 20:31:55 +0000 (GMT)
Message-ID: <6f55044373dea4515b831957981bbf333e03de59.camel@linux.ibm.com>
Subject: Re: [PATCH v2 0/9] Move vfio_ccw to the new mdev API
From: Eric Farman <farman@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Christian Borntraeger
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
 Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Christoph
 Hellwig <hch@lst.de>
Date: Mon, 13 Sep 2021 16:31:54 -0400
In-Reply-To: <20210913192407.GZ2505917@nvidia.com>
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <1e431e58465b86430d02d429c86c427f7088bf1f.camel@linux.ibm.com>
 <20210913192407.GZ2505917@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J2Mq2xTpaK-3MSFbfYoVTtsLoCLgmINY
X-Proofpoint-ORIG-GUID: r492AUbxpbkj-DNzhYj7IEyrQ8grPz3w
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
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

On Mon, 2021-09-13 at 16:24 -0300, Jason Gunthorpe wrote:
> On Mon, Sep 13, 2021 at 01:40:34PM -0400, Eric Farman wrote:
> > On Thu, 2021-09-09 at 16:38 -0300, Jason Gunthorpe wrote:
> > > This addresses Cornelia's remark on the earlier patch that ccw
> > > has a
> > > confusing lifecycle. While it doesn't seem like the original
> > > attempt
> > > was
> > > functionally wrong, the result can be made better with a lot of
> > > further
> > > work.
> > 
> > I thought I'd take a stab at seeing how this works with the
> > hardware
> > before looking at the code much. git couldn't apply patches 1, 6,
> > or 9
> > to 5.15-rc1, but I was able to hand-fit them into place. 
> 
> Oh? Thats odd, I had no remarks from git when rebasing onto
> v5.15-rc1..
> 
> Maybe this is a situation where you need "b4 am --prep-3way" ...

Ah, that does indeed help, thanks. Still missing the vfio-ap patch
that's elsewhere on the list, but I'm not caring about that at the
moment.

> 
> > [   64.585462] Call Trace:
> > [   64.585464]  [<0000000000000002>] 0x2 
> > [   64.585467] ([<000003ff80179d74>] vfio_ccw_mdev_ioctl+0x84/0x318
> > [vfio_ccw])
> > [   64.585476]  [<00000000bb7adda6>] __s390x_sys_ioctl+0xbe/0x100 
> > [   64.585481]  [<00000000bbfbf5e4>] __do_syscall+0x1bc/0x1e8 
> > [   64.585488]  [<00000000bbfcc8d8>] system_call+0x78/0xa0 
> 
> I think it is this:
> 
> diff --git a/drivers/s390/cio/vfio_ccw_fsm.c
> b/drivers/s390/cio/vfio_ccw_fsm.c
> index df1490943b20ec..5ea392959c0711 100644
> --- a/drivers/s390/cio/vfio_ccw_fsm.c
> +++ b/drivers/s390/cio/vfio_ccw_fsm.c
> @@ -441,6 +441,7 @@ fsm_func_t
> *vfio_ccw_jumptable[NR_VFIO_CCW_STATES][NR_VFIO_CCW_EVENTS] = {
>  		[VFIO_CCW_EVENT_IO_REQ]		= fsm_io_error,
>  		[VFIO_CCW_EVENT_ASYNC_REQ]	= fsm_async_error,
>  		[VFIO_CCW_EVENT_INTERRUPT]	= fsm_disabled_irq,
> +		[VFIO_CCW_EVENT_OPEN]		= fsm_nop,
>  		[VFIO_CCW_EVENT_CLOSE]		= fsm_nop,
>  	},
>  	[VFIO_CCW_STATE_CLOSED] = {
> 
> I rebased it and fixed it up here:
> 
> https://github.com/jgunthorpe/linux/tree/vfio_ccw
> 
> Can you try again?

That does address the crash, but then why is it processing a BROKEN
event? Seems problematic. All the configuration works fine, but the
devices get ripped away once a guest is started that wants to open/use
them.

So, there's more problems to figure out.

Eric

> 
> Thanks,
> Jason

