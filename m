Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1AF350280
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 16:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70346EAC2;
	Wed, 31 Mar 2021 14:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B22F6EABB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 14:39:40 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VEcjuP011429;
 Wed, 31 Mar 2021 14:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=vknIUQ9qIU6rHrMlFV9EpEqJlf2XfgtpLtF9ntaI+x8=;
 b=S8l9oMk16Bikowo7AFHF6opZDw5a4cbmkbrUEvu8bZ97l1fZjK2zIpAmlM+sVUaSdWrh
 C+mDN0i0eOnoEfQ+Xow6DS1ZzQC0pNoTLMu6Vx5A0WGck7aUOVAg1kfMnR7pQFm0P2yf
 2dfFAUbSBUPUT38NvTEo6cPRNqbJZjDeRovMdwml6N1J3h2B1cf4Ac1CcPZqjJzbTYhc
 h/gvZIJ1AQNoTT0nSrGru/AFIsN0QnufPhDYSEfZs6GMTTInjpxSKm95UabWGUbabar3
 drewUREPfna+zcb1w1BL2gw2ppb5/7/oL/MKcxpNCeI3HzNgIhHaIdrHuN4p01L+5g+i Bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37mafv2f5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:39:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VEKfBg187628;
 Wed, 31 Mar 2021 14:39:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 37mac5jmjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:39:35 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12VEdUHh010695;
 Wed, 31 Mar 2021 14:39:30 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 07:39:30 -0700
Date: Wed, 31 Mar 2021 17:39:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v4 1/1] drm/bridge: lt8912b: Fix issues found during
 static analysis
Message-ID: <20210331143923.GO2088@kadam>
References: <20210331114919.370053-1-adrien.grassein@gmail.com>
 <CGME20210331114933eucas1p10c9dd909be58d7c78799c8a38c45ddba@eucas1p1.samsung.com>
 <20210331114919.370053-2-adrien.grassein@gmail.com>
 <ba8f5a59-e428-ab21-23b9-0a7e650f532c@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba8f5a59-e428-ab21-23b9-0a7e650f532c@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310105
X-Proofpoint-ORIG-GUID: 2H6zCgtgHGjeMBOYfdsuk7M1hXuQHURN
X-Proofpoint-GUID: 2H6zCgtgHGjeMBOYfdsuk7M1hXuQHURN
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310106
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
Cc: Adrien Grassein <adrien.grassein@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 02:57:31PM +0200, Andrzej Hajda wrote:
> >   
> >   	if (!of_device_is_compatible(port_node, "hdmi-connector")) {
> >   		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
> > +		of_node_put(port_node);
> >   		ret = -EINVAL;
> > +		goto err_free_host_node;
> 
> Maybe better would be to put of_node_put(port_node) after 
> err_free_host_node label - of_node_put(NULL) does nothing.
> 

I prefer this style for several reasons:
1) I kind of hate no-op puts
2) The port_node is not part of the wind up in the sense that we don't
   leave hold the reference on the success path.  It's the same with
   locking, I prefer if unlock happens before the goto.  Sometimes
   people do an unlock as part of the unwind but this style only works
   for the first label in the unwind path.
3) I like when you can copy and paste the unwind code to create the
   release function, lt8912_put_dt() in this example.  Normally you have
   to add one more release function because most times the last failure
   path is an allocation but in this case the release is just
   of_node_put(lt->host_node);

But, yeah, putting the of_node_put() after the label isn't bug so
whatever...

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
