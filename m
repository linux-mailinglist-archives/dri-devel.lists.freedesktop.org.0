Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1953F8E15
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 20:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98896E89B;
	Thu, 26 Aug 2021 18:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4F06E89B;
 Thu, 26 Aug 2021 18:45:58 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17QIYgVP111517; Thu, 26 Aug 2021 14:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=sEiGmVlUaC7aep5Tl84luDE5U7RAwXJa7CjOVhF4Sn0=;
 b=Hkmq2KqVUFGDdZ0j8WeaPy0hZUJ71g44z5yYR4wsBoPk6mnmouAmhcoIeYVZC22XXsXp
 oV6cTjog8qDsdDLzFXaU1sXz1H33smvYeHrDUSyRFz6+h/3wBM/jpwOYfnen/7cEMJf0
 pj581xJwz6zIfqcGD6H51xMBN8diTqD4zUie+arrjsccDKXMkLhFWBqavne3FOSWYD8y
 jGXU6SRpNEu21NpT+2RaXlZ0qYWg2rPHgSdbTH9NtDXOJrPYm38UDXNpd+Vv7Ejz8hBI
 urxAnRQjTBmKn9crob/4aSMoHCzQG1odAt/uhzRFN1WtsjRN4UMq5omzKjBXFDYdvzHJ bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3apfus95a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 14:45:51 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17QIZTrW122396;
 Thu, 26 Aug 2021 14:45:51 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3apfus959j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 14:45:50 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17QIh3AI028381;
 Thu, 26 Aug 2021 18:45:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ajs48gahf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 18:45:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17QIfvZc59310550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 18:41:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB432AE059;
 Thu, 26 Aug 2021 18:45:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B18DAE055;
 Thu, 26 Aug 2021 18:45:46 +0000 (GMT)
Received: from osiris (unknown [9.145.23.223])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 26 Aug 2021 18:45:46 +0000 (GMT)
Date: Thu, 26 Aug 2021 20:45:44 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [BUG - BISECTED] display not detected anymore
Message-ID: <YSfhWN/PDvXbY/z8@osiris>
References: <YRe7I67h4gMVOWuu@osiris> <YRztFhtGS9RkP2Bf@osiris>
 <YR6d3nU1R14Eqpic@intel.com> <YR/SvvDxQjp52h6A@osiris>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YR/SvvDxQjp52h6A@osiris>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q8dLSfINTClU6f9BDs735aup7GpaEGrT
X-Proofpoint-GUID: 3YEIBBti8k-A8rxN08EbMh241FcIq3x1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-26_05:2021-08-26,
 2021-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108260102
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

> > > ef79d62b5ce5 ("drm/i915: Encapsulate dbuf state handling harder")
> > > 
> > > With that commit the display is not detected anymore, one commit
> > > before that it still works. So this one seems to be broken.
> > > 
> > > Ville, Stanislav, any idea how to fix this?
> > > 
> > > commit ef79d62b5ce53851901d6c1d21b74cbb9e27219b
> > > Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Date:   Fri Jan 22 22:56:32 2021 +0200
> > > 
> > >     drm/i915: Encapsulate dbuf state handling harder
> > 
> > That has nothing to do with display detection, so very mysterious.
> > 
> > Please file a bug at https://gitlab.freedesktop.org/drm/intel/issues/new
> > boot with drm.debug=0xe with both good and bad kernels and attach the
> > dmesg from both to the bug.
> 
> Everything (hopefully) provided here:
> https://gitlab.freedesktop.org/drm/intel/-/issues/4013
> 
> Please let me know if you need more, or if I can help otherwise to
> resolve this.

Did you have any time to look into this already?
