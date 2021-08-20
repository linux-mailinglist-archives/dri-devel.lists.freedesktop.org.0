Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A43F30F8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 18:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFF36EAC8;
	Fri, 20 Aug 2021 16:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298AC6EAC9;
 Fri, 20 Aug 2021 16:05:32 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17KG4Wwl061667; Fri, 20 Aug 2021 12:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZaVFqy1CY3N/hNpdG6T9z3s/w/ADEcv8yKreDG3OgKc=;
 b=OkmGxi9iV+WiYijrQIUhUtZhAwBRsqPpjlex+iFLmS5NkxRWJwobnKXwMhNmfuNtCAgU
 F2nvy1fh/GgFcd1d2nEMwY/3DrPHSf4FJtOutAh0RjM6Mc+sM3T+plUrRDnSNaDQjnqD
 KIBpeK4/f4rPVU2UeJGjHGIHTj5t9QjsrzpCO+MVkz+YmmC1rPHxbgdk0LdRpOy9+Pj5
 pA+zxS/HATrt5XiGSZZcjUs4+ISww1Bpk9fk4izFrpPeyqq1/6abMggHNnaUg0G7/NQ8
 h5hQHksgXDPJ1UzGyUUuBMzRMNXUoem/PU9gSJIl7eQ8OqvXqvdYRjStqeGbxNM/IDAJ 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ahq10gqa6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Aug 2021 12:05:25 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17KG4mKN063171;
 Fri, 20 Aug 2021 12:05:25 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ahq10gq94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Aug 2021 12:05:25 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17KG2wY9018283;
 Fri, 20 Aug 2021 16:05:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3ae5f8grv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Aug 2021 16:05:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17KG1mwn30146964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Aug 2021 16:01:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D79811C018;
 Fri, 20 Aug 2021 16:05:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9E8111C01E;
 Fri, 20 Aug 2021 16:05:19 +0000 (GMT)
Received: from osiris (unknown [9.145.56.92])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Aug 2021 16:05:19 +0000 (GMT)
Date: Fri, 20 Aug 2021 18:05:18 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [BUG - BISECTED] display not detected anymore
Message-ID: <YR/SvvDxQjp52h6A@osiris>
References: <YRe7I67h4gMVOWuu@osiris> <YRztFhtGS9RkP2Bf@osiris>
 <YR6d3nU1R14Eqpic@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YR6d3nU1R14Eqpic@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WB2z7Grtacn5CpCPiPDuN8xQwI4TCpSc
X-Proofpoint-GUID: UynuZFrGyrdvRWuLVnwHiiLSxStUybe1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-20_06:2021-08-20,
 2021-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108200091
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

On Thu, Aug 19, 2021 at 09:07:26PM +0300, Ville Syrjälä wrote:
> > ef79d62b5ce5 ("drm/i915: Encapsulate dbuf state handling harder")
> > 
> > With that commit the display is not detected anymore, one commit
> > before that it still works. So this one seems to be broken.
> > 
> > Ville, Stanislav, any idea how to fix this?
> > 
> > commit ef79d62b5ce53851901d6c1d21b74cbb9e27219b
> > Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Date:   Fri Jan 22 22:56:32 2021 +0200
> > 
> >     drm/i915: Encapsulate dbuf state handling harder
> 
> That has nothing to do with display detection, so very mysterious.
> 
> Please file a bug at https://gitlab.freedesktop.org/drm/intel/issues/new
> boot with drm.debug=0xe with both good and bad kernels and attach the
> dmesg from both to the bug.

Everything (hopefully) provided here:
https://gitlab.freedesktop.org/drm/intel/-/issues/4013

Please let me know if you need more, or if I can help otherwise to
resolve this.
