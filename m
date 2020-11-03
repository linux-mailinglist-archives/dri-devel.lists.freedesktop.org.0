Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA60D2A3CBD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 07:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917FC6E4AD;
	Tue,  3 Nov 2020 06:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065BB6E4AD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 06:23:25 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A36NMvW176189;
 Tue, 3 Nov 2020 06:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=lZOHWPsincrv3NJRwbyRUhrikhjn5Ipqz57akT+/cGM=;
 b=M2PhN13z8RPLxK3ntNez/oevTIL6/voiO9lbqxViJqjJk4uxT55zupkRtOrKNt2KsVOm
 Aa8Eo5IPBMG6OGi2n5swsHYtN0B4ox2g+BLXzrAU+cAdGDE7W2nuVXVKWHYjNY4DBOnh
 fk6VGJE5CmHJpn4c9UNEOU+9cTz+7tJ/oimxXwjU4vkwf13ziJ8CwRtT5lKHfnXHFR17
 pmkDCzB6g1NnHvlsncLIEjNnkXayZiWcVMVWrpbvhdMiA/xdYu72LYsrSJIRo3n6X18s
 kgPn4+KhakCsRDnhM6xHOZkOHBeUi273czpZfk0zpWC0gVGbRTXIKhJSu3m9y2XLwXQz ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34hhvc7g5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 03 Nov 2020 06:23:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A36ARhO087681;
 Tue, 3 Nov 2020 06:23:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34hw0ge65w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Nov 2020 06:23:21 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A36NL6b023284;
 Tue, 3 Nov 2020 06:23:21 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Nov 2020 22:23:20 -0800
Date: Tue, 3 Nov 2020 09:23:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [bug report] dma-buf: Clarify that dma-buf sg lists are page
 aligned
Message-ID: <20201103062313.GB18329@kadam>
References: <20201102081508.GA104814@mwanda>
 <MW3PR11MB4555588F506D774990798A47E5100@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555588F506D774990798A47E5100@MW3PR11MB4555.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030047
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 09:33:08PM +0000, Xiong, Jianxin wrote:
> Hi Dan,
> 
> Thanks for reporting the bug. I see what was missing. Am I supposed to submit a patch to
> replace the original patch or just to fix this bug?
> 

Once the patch has been applied, then it's too late to replace it.  Just
send a patch to fix it.

regards,
dan carpenter

> Jianxin 
> 
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Sent: Monday, November 02, 2020 12:15 AM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Subject: [bug report] dma-buf: Clarify that dma-buf sg lists are page aligned
> > 
> > Hello Jianxin Xiong,
> > 
> > The patch ac80cd17a615: "dma-buf: Clarify that dma-buf sg lists are page aligned" from Oct 14, 2020, leads to the following static checker
> > warning:
> > 
> > 	drivers/dma-buf/dma-buf.c:917 dma_buf_map_attachment()
> > 	error: 'sg_table' dereferencing possible ERR_PTR()
> > 
> > drivers/dma-buf/dma-buf.c
> >    897          sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
> >    898          if (!sg_table)
> >    899                  sg_table = ERR_PTR(-ENOMEM);
> >    900
> >    901          if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
> >    902               !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> >    903                  dma_buf_unpin(attach);
> >    904
> >    905          if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
> >                     ^^^^^^^^^^^^^^^^^
> > 
> >    906                  attach->sgt = sg_table;
> >    907                  attach->dir = direction;
> >    908          }
> >    909
> >    910  #ifdef CONFIG_DMA_API_DEBUG
> >    911          {
> >    912                  struct scatterlist *sg;
> >    913                  u64 addr;
> >    914                  int len;
> >    915                  int i;
> >    916
> >    917                  for_each_sgtable_dma_sg(sg_table, sg, i) {
> >                                                 ^^^^^^^^^ Not checked here.
> > 
> >    918                          addr = sg_dma_address(sg);
> >    919                          len = sg_dma_len(sg);
> >    920                          if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(len)) {
> >    921                                  pr_debug("%s: addr %llx or len %x is not page aligned!\n",
> >    922                                           __func__, addr, len);
> >    923                          }
> >    924                  }
> >    925          }
> >    926  #endif /* CONFIG_DMA_API_DEBUG */
> > 
> > regards,
> > dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
