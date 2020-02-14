Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DB6160CF5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3C76E88A;
	Mon, 17 Feb 2020 08:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2933 seconds by postgrey-1.36 at gabe;
 Fri, 14 Feb 2020 18:30:12 UTC
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC546FB7E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 18:30:12 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01EHdOCr069590;
 Fri, 14 Feb 2020 17:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=KmIo45/8rqTg+TK1KulK6p+LZsxnvdRAU4LsG4AGcFA=;
 b=yewe0/WD7pxSXUGJYSzccmoQh5jmPWdrnBPN2j2OMmFa1XrlxWAKzUpMdDrgq8Es6qRS
 mIRAS3dyhyMiRtdb0Zl7lqaMNMgIvXcwNc4+/OH1Hl6Tt/vpCj3cx9XUZQ1PPhpb6LCW
 vWBC/SL3ljjb5zcjXEw7d7n0kqk1dRbeCx/Ky67WK3zPD8LK7agSdjsWLeeFn7NaTkyI
 rmTpv1xqDamLAF4+zoDr17fSTtEbRJRY904qqbURjWa/P+dp3JOeE0ZVhvnFHs0FaipU
 vgp5xwHmPMLNM82Yfhkj/dyWGQLBLaTeigtWj9ux1XOk2mxpssdAqs8mxhWlTC8G2GES Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2y2p3t2q6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 17:41:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01EHbIHs132568;
 Fri, 14 Feb 2020 17:41:02 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2y4k9mwvdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Feb 2020 17:41:02 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01EHews6020773;
 Fri, 14 Feb 2020 17:40:58 GMT
Received: from [10.209.227.41] (/10.209.227.41)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 Feb 2020 09:40:58 -0800
Subject: Re: [PATCH resend 0/2] dts: keystone-k2g-evm: Display support
To: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <cover.1581671951.git.jsarha@ti.com>
From: santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <6749076a-cbc1-d8e2-bc35-2e2a9ad80a6d@oracle.com>
Date: Fri, 14 Feb 2020 09:40:55 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cover.1581671951.git.jsarha@ti.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9531
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002140133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9531
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002140133
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: mark.rutland@arm.com, praneeth@ti.com, robh+dt@kernel.org,
 peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/14/20 1:22 AM, Jyri Sarha wrote:
> Resend because the earlier recipient list was wrong.
> 
> Now that drm/tidss is queued for mainline, lets add display support for
> k2g-evm. There is no hurry since tidss is out only in v5.7, but it
> should not harm to have the dts changes in place before that.
> 
> Jyri Sarha (2):
>    ARM: dts: keystone-k2g: Add DSS node
>    ARM: dts: keystone-k2g-evm: add HDMI video support
> 
>   arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
>   arch/arm/boot/dts/keystone-k2g.dtsi    |  22 ++++++
>   2 files changed, 123 insertions(+)
> 
Ok. Will add this to the next queue.

Regards,
Santosh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
