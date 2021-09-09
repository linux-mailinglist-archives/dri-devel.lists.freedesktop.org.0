Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0F4046CE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 10:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CCF6E488;
	Thu,  9 Sep 2021 08:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A259F6E488;
 Thu,  9 Sep 2021 08:12:47 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 189852Mw069685; Thu, 9 Sep 2021 04:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1QBC0gO9jX+j/GMDkp+6FzlHfqejN+eqZ3u8oR8pMBg=;
 b=U8gAi7CP+q8RETXzouDkNcyKv5feeYDKkRgKpZYzRrnHqneKCQDO47OcDfHIQ6g4U42c
 fpSu+1ozhX6IoD7Q/I7o4aQDz5mlbtOb538dA5uBuMf12l/Fk6IhMNI5iI+CCKFXfz8o
 40sHTe866MYf7mE0ptOlOLvkhkX1jnXao4ACtl8QG8JkGDid55RBmdCh/+LgCNfXkRb6
 ZwO4OKyd1uk4XzUvA+4p7f0ZFWHSDORqvJpVYtPGqaWV6TB8YCKaeC8AhzvdA3X56jRv
 OjudKqOADYRK2dbYYpLOD/6RNHxVEFWC0Y1ymkUJymKrOx4oSPw4tuMCb4HxG+Jt2YsG Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ayebwraeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 04:12:43 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18985a2w071993;
 Thu, 9 Sep 2021 04:12:42 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ayebwradw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 04:12:42 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18987KUD031154;
 Thu, 9 Sep 2021 08:12:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3axcnnsw9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 08:12:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1898CcmA45220220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Sep 2021 08:12:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CCF44C066;
 Thu,  9 Sep 2021 08:12:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A4154C04E;
 Thu,  9 Sep 2021 08:12:38 +0000 (GMT)
Received: from osiris (unknown [9.145.66.211])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Sep 2021 08:12:37 +0000 (GMT)
Date: Thu, 9 Sep 2021 10:12:36 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [BUG - BISECTED] display not detected anymore
Message-ID: <YTnB9BxCjq8Ihek7@osiris>
References: <YRe7I67h4gMVOWuu@osiris> <YRztFhtGS9RkP2Bf@osiris>
 <YR6d3nU1R14Eqpic@intel.com> <YR/SvvDxQjp52h6A@osiris>
 <YSfhWN/PDvXbY/z8@osiris>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YSfhWN/PDvXbY/z8@osiris>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6CRkUUYFYLIw6xE6cDQ1lTYvH3yVaE3W
X-Proofpoint-GUID: CRST49t0LiBeGCQaDMBwTrDxYhSgyFX1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-09_02:2021-09-07,
 2021-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090048
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

Hi Ville,

> > > > ef79d62b5ce5 ("drm/i915: Encapsulate dbuf state handling harder")
> > > > 
> > > > With that commit the display is not detected anymore, one commit
> > > > before that it still works. So this one seems to be broken.
> > > > 
> > > > Ville, Stanislav, any idea how to fix this?
> > > > 
> > > > commit ef79d62b5ce53851901d6c1d21b74cbb9e27219b
> > > > Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > Date:   Fri Jan 22 22:56:32 2021 +0200
> > > > 
> > > >     drm/i915: Encapsulate dbuf state handling harder
> > > 
> > > That has nothing to do with display detection, so very mysterious.
> > > 
> > > Please file a bug at https://gitlab.freedesktop.org/drm/intel/issues/new
> > > boot with drm.debug=0xe with both good and bad kernels and attach the
> > > dmesg from both to the bug.
> > 
> > Everything (hopefully) provided here:
> > https://gitlab.freedesktop.org/drm/intel/-/issues/4013
> > 
> > Please let me know if you need more, or if I can help otherwise to
> > resolve this.
> 
> Did you have any time to look into this already?

How do we proceed with this? Saying that this is either "very
mysterious" or "very strange" won't fix the regression. :)

Thanks,
Heiko
