Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ACC38168A
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 09:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EF96E053;
	Sat, 15 May 2021 07:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1250 seconds by postgrey-1.36 at gabe;
 Sat, 15 May 2021 07:18:08 UTC
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C776E053
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 07:18:08 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14F6vGeH001473; Sat, 15 May 2021 06:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=s8UkRbwZXdqac3yfFT2NmhPMJwQarVwd8YCHK1TZLlU=;
 b=rGaeV4J3V0zJ9SezpMMw/yh85DvwDPxum5nCSoQFbwc5NpXi3G4+4vsDIkCrR/dYTKcA
 38Y2l8PoE2XIIxWcSbk4HzI4cYFsvTKO4gePJwbCF3vt2hRim1//D8oQsoZq/RRydUb0
 ZhN5VjKFLkoQ0nOr16K8gbYperG4YVlwZ76aAAtfWa/e99DqCrnh6En6aaaDkG1qIKdi
 05//WTcMsxOZuOWHUWH2Sme2NXzx/YGVT9ESqb5N0y4XyLWBjaXb8ivuRSDdRY5wGKfE
 S41khI3qeDjF3t9Vya012GIXoo48VHgyPC5sHL8Wgc6DSa0WuSgTHR26eI0dQ83SWiKq 1w== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38j6usg12e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 06:57:16 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14F6vFcu163180;
 Sat, 15 May 2021 06:57:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38j4b9ma30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 06:57:15 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14F6vFTG163171;
 Sat, 15 May 2021 06:57:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 38j4b9ma2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 06:57:15 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14F6vE1Q004978;
 Sat, 15 May 2021 06:57:14 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 May 2021 23:57:14 -0700
Date: Sat, 15 May 2021 09:57:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joseph Kogut <joseph.kogut@gmail.com>
Subject: Re: [bug report] drm: remove usage of drm_pci_alloc/free
Message-ID: <20210515065706.GH1922@kadam>
References: <YJ6BJBgS0HnPgzsJ@mwanda>
 <CAMWSM7gBU9VOZovOB29ZGKNvL_tXxWk1z0GD44n0=wYk+eAXUA@mail.gmail.com>
 <CAMWSM7gN3m3NT6BMQfcmNr_Vxi_R17oC1wzpprshpTJW3cQzvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMWSM7gN3m3NT6BMQfcmNr_Vxi_R17oC1wzpprshpTJW3cQzvg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: n_eGG5MdgoWi1YR2XdHrEA1gOjGEH0j1
X-Proofpoint-ORIG-GUID: n_eGG5MdgoWi1YR2XdHrEA1gOjGEH0j1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 09:34:27AM -0700, Joseph Kogut wrote:
> On Fri, May 14, 2021 at 8:13 AM Joseph Kogut <joseph.kogut@gmail.com> wrote:
> >
> > Hi Dan,
> >
> > On Fri, May 14, 2021 at 6:54 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > Hello Joseph Kogut,
> > >
> > > The patch 70556e24e18e: "drm: remove usage of drm_pci_alloc/free"
> > > from Apr 22, 2021, leads to the following static checker warning:
> > >
> > >     drivers/gpu/drm/drm_bufs.c:1090 drm_legacy_addbufs_pci()
> > >     warn: inconsistent returns '&dev->struct_mutex'.
> > >       Locked on  : 988
> > >       Unlocked on: 938,944,951,959,973,1005,1042,1060,1090
> > >
> 
> Do you mind if I copy this portion of the bug report in the commit message?

Yeah, that's normal.  No need to ask.

regards,
dan carpenter
