Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A347D2641DE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDA46E8D4;
	Thu, 10 Sep 2020 09:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10065.outbound.protection.outlook.com [40.107.1.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1146E8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:30:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwCFBZXOpm4uW3MK0UWGsSFLPF01wWcQTzwhSRkuKQbGAYBhDvkDjMlhQmHH19lkC5RpRnB6RUwzGsK0M3RCOh6ipwR8+diajl43q96dCzmmf8YVwAicCd6rj3BIOpZI8NrhkK7aLPRiomGNTYvuJtZlCmc/z81rIamnMtNAVh7VzrcZBxC76Z33/idvZlGhIEMKI3BrzEHayA1L6uo9bPpFAPwNKrgUhJpGzZbWS+FfbgZD5gUBy5pHhRZhLfDVOs0X/PuH70pdOjq/NYy96Wjs/HgUkse6A+a7uKqwc4w1lj3g+g5EAF1w4hiK3xOq+e802/3cu5TBPyvaLOEVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmZyw7IibEDir8BiosRGlR2NqJTijIpv3rl/yssn3Wc=;
 b=WomRfnhWLO4L+MqflhRpho2qeW+RzxWdGLsrrRXzZZfiHU3GwpXuunas5lFDsuggUrl1nT3q25gfBRxYzm0iw0RzjFc/lCl6XVHgQh6PmvKF/BLYSN6xabGN9gflFN/oQt6pI4CEbtuJZkw0JjI6U5UypM8Kl0uscXqcrzFmvh9wbtmIya8KymC5/0ht4+mZarnGijYLut4T17PhV9gW+f0O+hq72tkBP72cr+t/EVf1ccczmG49frXLvpWRbGibIQ5CN/B9Cbez7g52HXOlWgT+/YuC3c46Uv2/6WSN4OhRIgqjFMtKKcD13S9AMsX+2Kfe33Xj+0UBam/iMZ7B7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmZyw7IibEDir8BiosRGlR2NqJTijIpv3rl/yssn3Wc=;
 b=QgEWrszbAapzW/dBqsC1bTq/GqVIOR+lzKV6vVO7sJhBThSlvJdsBWQth9nKEsZ9aPbqHG6IRiyjs5EtDDYT0U97KEPyUUzclCB+46TOP2u8yTvko4Vrc6FV74xr52f+PiAEkq7uoLzB3kV6sftpgXRqELWlT1gX957HJs/ktdM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4397.eurprd04.prod.outlook.com
 (2603:10a6:803:74::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 10 Sep
 2020 09:30:14 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:30:13 +0000
Date: Thu, 10 Sep 2020 12:30:09 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910093009.qkb5yvpyf46uj6mp@fsr-ub1864-141>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
 <20200910115026.58dffaf1@eldfell>
Content-Disposition: inline
In-Reply-To: <20200910115026.58dffaf1@eldfell>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:208:14::17) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:208:14::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:30:12 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f3eb305-15db-4b29-3e48-08d8556c1e76
X-MS-TrafficTypeDiagnostic: VI1PR04MB4397:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB43979E490FF3DFC7D54FBABDBE270@VI1PR04MB4397.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/LYj0hHlV5ChHt3h5XIiKeyDEkz+G/1GWH0P9CZxgDMt/wNQybD7y2zgXzj5MpisBL+8BXFrGaAHaT9qt3n4QTMFTqhAJThqx4nSBb/6GRPdT2EdP+pB0mG3NrXc8LrkPKvEaf7MpwP9VLZJBImDjK7tkU37jgRccrlxxZJamJNiVQ+Wg5v7YBM2ZrqVdG930+inFSFowM/V49M+iwLszKPpEdX2B1FVO/tKFTiQjFKs8tYnHeE+hm7CeyIP1KiVu6N5fR+TfgDh5C+2ZecU84YAyv6pqwYwXVXpoRC73OsxTsWdXI4Xg5EhtksBhTMFpXQMc0lsmgld4jHIMlFLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(83380400001)(2906002)(4326008)(3480700007)(478600001)(1076003)(44832011)(8676002)(316002)(86362001)(9686003)(66476007)(66556008)(26005)(956004)(6496006)(5660300002)(54906003)(6666004)(55016002)(8936002)(16526019)(52116002)(33716001)(66946007)(186003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Su5xRL99VB/6af88Alj/d0nAv7llZ/iVbX8BzabhFkVEnSk4ARyqhy+84rkluVVu7kswl6naydbAXT5g6Jw0/cNL15V0ERVTI0SVmx1KH2J615TROtDSKbhqFNFq6BwIa9ABY7lHNkGWm1h1+IO/2QWEc/SXafqkQKU+Z7AsHkBfDzHgu2joufJ+mUWrbCzTsb6y9l+QOrcAcw+syFQctZ9wVB5HaTtgtI8EptXr/4pM+S7WBY5mZyLmgV3X21EHH/bxewwvB5EAfOW8XwBtRV9s60TPMDL8WQuHf+FJRbeJev7gWw7ZmqbvLQtUFpPdh4t4AILkYIIA+ffsXOdFWz3weZVzcWtumsyGh7VXOA8OPFuKlGYjC5ED2vroyrI5WonzqvN2Tf08658MenA6xDmsqus4L+VGafS0ho0LYgNJq4TM6F7ducRoyGM4tN9u3qJQvqVLaCv+2JPymUgzV4Xf3hHHc4/WBHgtRKZDl9zBASBH2CRrw1ysmT5W5YD6+KjljAfkm6WhMO2Ic2C/hBx/L3mViIBf0fcOfICmjbVXNlNDBCS3O2ZExEVDgLf6GFIign0VNERSXXZjot/nIFWN8WBbwtuZzqm2bwUNXxfMY18K/bjQR0Dz29CyKsZPX4HCDqqxYzOJ9by7qGsDxw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3eb305-15db-4b29-3e48-08d8556c1e76
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:30:13.2677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lko3serVB4pIF/krtOli10HJSgwWTVqkOkX4cK+b9HrVzGioBkjX5YqI1jr9nfZTGkJwIEp+7GdX2GKeOwPeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4397
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
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>, dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
> On Thu, 10 Sep 2020 09:52:26 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:
> > > On Wed, 9 Sep 2020 13:57:28 +0300
> > > Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> > >   
> > > > Hi all,
> > > > 
> > > > I was wondering whether you could give me an advise on how to proceed further
> > > > with the following issue as I'm preparing to upstream the next set of patches
> > > > for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
> > > > each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
> > > > respectively. Then the output from those 3 pipes is blended together and then
> > > > gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
> > > > needed.
> 
> Hi,
> 
> hmm, so FB -> CSC -> LUT -> CSC -> blending?
> 
> Is it then
> 	blending -> LUT -> CSC -> encoder
> or
> 	blending -> CSC -> LUT -> encoder?

The DCSS pipeline topology is this:

FB1->CSC_A->LUT->CSC_B-\
FB2->CSC_A->LUT->CSC_B-|-blender->LUT->CSC_O->encoder
FB3->CSC_A->LUT->CSC_B-/

Basically, CSC_A is used to convert to a common colorspace if needed
(YUV->RGB) as well as to perform pixel range conversions: limited->full.
CSC_B is for gamut conversions(like 709->2020). The CSC_O is used to
convert to the colorspace used by the output (like RGB->YUV).

> 
> Are all these LUTs per-channel 1D LUTs or something else?

LUTs are 3D, per pixel component.

Thanks,
laurentiu

> 
> What ever the KMS UAPI for these is going to be looking like, it
> obviously needs to define all this. So I'm guessing we need to define
> the abstract color pipeline of KMS in general that includes everything
> any driver might want to expose. Then each driver picks the blocks in
> the pipeline it wants to expose and the other blocks are assumed to be
> "identity transform".
> 
> Without such general abstract color pipeline defined and documented it
> is very unlikely IMO for generic userspace to make use of the driver
> features.
> 
> All blocks must also default to identity transform. A block
> unimplemented by a driver is the same as a block not used or understood
> by a KMS client.
> 
> Userspace that does not understand all the blocks will need to use the
> "harmless default values". This then ties in with what I've discussed
> with danvet before: when you are VT-switching from one KMS client to
> another, how do you reset the full KMS state (including blocks you
> don't understand) to the same state you had before. The other KMS
> client may have messed them up while you were gone.
> 
> All this default value talk is to ensure that the abstract KMS color
> pipeline can be extended without breaking existing userspace.
> 
> ...
> 
> > > > So, how should I continue with this one? Any pointers?  
> > > 
> > > Hi,
> > > 
> > > I can't help you, but I can say that we are currently in the process of
> > > designing a color management and HDR extension for Wayland, and I'm
> > > sure in the long term I would like to use per-plane color space
> > > transformation features of KMS in Weston eventually.
> > > 
> > > IOW, one more userspace that is going to be taking advantage of such
> > > features as long as they are not too driver-specific.  
> > 
> > Personally I think best to wait for userspace to come up with color
> > manager protocols, that should give us a much clearer idea of what the
> > kernel interface should look like. Since hw is pretty special in this
> > area, I expect we'll have to do a bunch of impendendance mismatching in
> > the kernel anyway.
> 
> Speaking of that, where should we scream if we feel like we are missing
> KMS properties to get the best out of color management and HDR in
> Weston, assuming we're not kernel devs?
> 
> Who to Cc?
> 
> We currently have intel and AMD hardware at hand if that makes any
> difference.
> 
> 
> Thanks,
> pq


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
