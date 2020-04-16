Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D71ABB55
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 10:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31086E2B0;
	Thu, 16 Apr 2020 08:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DF66E233;
 Thu, 16 Apr 2020 08:34:57 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03G8SBh4154558;
 Thu, 16 Apr 2020 08:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=p+Dt8afETPBHGWQDAy3rSGf9i8tLMRVwu8kfmVUG6wo=;
 b=HZg4J+j8vulLiiwBTFKGbIIM4hK6WjOL7JwEW1UmSHi3sNs6eJUdJ4iMDnvnlzccXpPp
 OCqyCrIOrtc0/lpsB/0c7GAgZ7/8VU+lwaKjHlqxE3bja2bsxJdoYuTdB5eXUCSnudZM
 zeJkS2FZbAisBDAS61/HFUp+FkbmSHFMC4ashOsMPE5gg6PJ50TwjZBiGcI5w12SmVTs
 8SHr6h2w2xtDDrsiZHv9rs8MsFjAcsYDOGL7+7MKUylK6ZYbqFckSxtbmuVwGx+pcmlE
 vUPBUEuoA5yb0LBAEJd1c6+7ktCCBMZIKRoKsNOek/+6TFoU4EppC8xwYbbB21ADWBgA HA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 30dn95r09v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 08:34:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03G8S68c022555;
 Thu, 16 Apr 2020 08:34:43 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 30dn9eq3rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 08:34:43 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03G8Yewx012445;
 Thu, 16 Apr 2020 08:34:40 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 16 Apr 2020 01:34:39 -0700
Date: Thu, 16 Apr 2020 11:34:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: remove redundant assignment to variable x
Message-ID: <20200416083427.GK1163@kadam>
References: <20200414092359.GC1163@kadam>
 <43eb0cbb-9bf0-c99a-470d-8121c3108a5e@canonical.com>
 <87blnt5d7j.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87blnt5d7j.fsf@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9592
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004160058
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9592
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160058
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, David Airlie <airlied@linux.ie>,
 kbuild@lists.01.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Colin Ian King <colin.king@canonical.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 12:07:44PM +0300, Jani Nikula wrote:
> On Tue, 14 Apr 2020, Colin Ian King <colin.king@canonical.com> wrote:
> > Hi Dan,
> >
> > I'd post a revert, but I don't seem to see an upstream commit for this
> > this to revert against. What's the revert policy in these cases? Or can
> > the patch be just ignored by the maintainers so it's not applied?
> 
> It has not been applied, and will be ignored, in part thanks to the
> report.
> 
> However I think Dan's report is misleading in that it looks like it's
> about a commit while I think it should emphasize that it's a pre-merge
> report on the patch on the mailing list.
> 

To be honest, these are auto-generated by the kbuild bot and I was a bit
confused myself.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
