Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C898350B5D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 02:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245666EBD0;
	Thu,  1 Apr 2021 00:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9FC6EBC4;
 Thu,  1 Apr 2021 00:48:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOTr05b4kS9A0kcDoqed+/fCoqVC/7877eugNT0137vw/iKaO7Hihv+xNIhneHeBbGddpGBspaqJJuafzRQyUajdpSt3lStiSW6iEHrpjLKBQPJu7KH29TPAuZKTSorf8pZwt8jhQ0PZCl/W/jjXTVzUNLKjJKvu39Oatkr2/Pg53oFIbKsZP5TCVA7wC2+p43AHc92y92Fn1fzME3/kFVKWzQttJwgnapHGHJl74ZWGWRqIsoShm7y50jwxuC3M0bdgtMIO7trMIcEl3UHJp9NOXgFivPPODDEioW3zsQx9iiUYhmyyFOlK2YyaKzoUUai45OUvACr0HvfY0SEjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz98JO7Rw9cgfIpVlh5EBQkXIWFdkRDK6RFd3k/v4Fc=;
 b=NjqeWkKf6bAmVyjtn0UmeRw2Y32IboQISCcKq+3uaKw6HFdE1B8nyXH9+M14bg4jgA7dzUtpNSM49Y4fWsBnmxpXdYbP9C47mv8N3AjIKltLtIMOKGCAERpTCn/YFTKdso+HdDyzNERh+T6zb5SiSiSdpmKtTRTUIqw9PFSnq13tbDNhjeGuvhKnpWEbOrqqS//AiuRXOzj19+f1ji2S53IwmTMsqhxIj9/gD7nvSVV7C08VFWEYrDGUag4/DMF9JmxWFqBpJqE98S7doIIKGa2F7IgJGLugtNs9ABygZcW98TjCD0qcBXvaj/GMqtSY/e8V75Wq3GZAswFk3WZgqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz98JO7Rw9cgfIpVlh5EBQkXIWFdkRDK6RFd3k/v4Fc=;
 b=i/174J+krKtdZVcmGrUluXy0yJX2y3PTX6HE2bdzRu7H6y/8u3NwJISPKwXhZnSt0Y8Qp2XXveU6tBQsCLPts3mxyaT4oEZd3elf+NsoFfnLG1JJ9eqm7WvFnA0EuOX0jEsLDwo71S/sWnQRxouCNI6orHQjmI4754q2TfMFSCtOrQr3C3srqLWSMHCNUgCskAqcLgLidiuSSLg3hAz5Mo43X9zSUL/1fOa+uPZktZotAQ90L9Jov3q27gT3VQcMaIggRUsSfOMk/QoRURAycM/by3x4+roHtyoB3JWU06njOfuXkDB1xTKbn68ODRSiyhP1/fO2kOaPuFf4WdtUDw==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4402.namprd12.prod.outlook.com (2603:10b6:5:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 00:48:15 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 00:48:15 +0000
Date: Wed, 31 Mar 2021 21:48:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Message-ID: <20210401004813.GT1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <2124945.3NMGunUBXV@nvdebian> <20210331134604.GK1463678@nvidia.com>
 <35941260.J9UuDlmC3F@nvdebian>
Content-Disposition: inline
In-Reply-To: <35941260.J9UuDlmC3F@nvdebian>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL1PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:208:257::10) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL1PR13CA0035.namprd13.prod.outlook.com (2603:10b6:208:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Thu, 1 Apr 2021 00:48:14 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRlVN-006Z2B-Pv; Wed, 31 Mar 2021 21:48:13 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42981125-12dd-49f0-5d63-08d8f4a7d566
X-MS-TrafficTypeDiagnostic: DM6PR12MB4402:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB44028848F511BEA2DCFD3C26C27B9@DM6PR12MB4402.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DjxOcP4LY4OrfH23Hwf21uheIVMd7I/hcaJiZJBzvUXz9f43G382B+dyFOk7Ss4x0HAWYZpcvircUrZd6W7gs8qxFjytLur9dVGd80zgIQ+5RrDwafS5t2UN5Ws6lFXt/w7t298EPpSMR6u/lTIKbsvnUqqX8E0JASc0fbU527H8duHHz7mo+2XFC5TLN0xa80RYVwEtD4ZUsjhKOHtjWudU+hH1r+bTvk8M3OtRc2bG12mnMmkbUKBSUQAmOowVUavhBDULHPXkLqcc3xo1zVCIBX+9w4w4tVrHwYS9kiyj8UFApzlK61Fp70hFEwATLH9CesBP4mEa712yi9J76eddt31sf6w80CGU+A5BwXHALOFhD72BuKrsBwY9903639rnOXW4c09+3s6+eR9i82CWURIW2ogeBvgiNy9oIZo6YY9Kj4vCulXIDQlGBNzXekkNZEAf5Rh/oshmnKtcCrl42n57X1pDVnh5m0ltiSsN4JbYrFrOcQKkC4vgv+wTvJ1yn7J1XAfZNtDLBpp2aUm275k9+NKaryjMdZA3dB5Umc0h85m3uYhbuQ7cibAox4jQ1GisUbNoSuFnNBGwVQRDnD4hNFyKogX0LUEZCQRGdYYG16qEPIjomS/YTbjVVn+x5CwgM6n4i8oPtv/fG5o74fp5aQP2dlB0Dq8sWoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(2906002)(426003)(9786002)(6862004)(9746002)(6636002)(36756003)(7416002)(66946007)(86362001)(26005)(38100700001)(33656002)(66556008)(4326008)(8936002)(186003)(5660300002)(1076003)(8676002)(83380400001)(37006003)(66476007)(498600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lEx2oTexgFZdT3BrobyUhqtm8q8YzB2tW/kwCH7j2EgU23wShM61IuiqjU16?=
 =?us-ascii?Q?5sLkf8KUCGTVLsLFcNzIymHSaiyiwmf3zVQ99VQ/yWXd3yOm2cX+WapzDvcd?=
 =?us-ascii?Q?Z2H8IF7uXenpTdnCdpq1fXchC2QPR43Mzow0+7ZKEmVuQqh+LRxZPiKhfu2I?=
 =?us-ascii?Q?QH6/LIZ5O/nkCuh5/VctsKNdd9N1ufwG5A3UX4W38hEBMVQ3iRW//kqKA9xm?=
 =?us-ascii?Q?2/4mH+w0UWG5oF8NB3afwEsW2kdMVGg1N9M+ljdcw/K326p0XtrIE4/FWN9n?=
 =?us-ascii?Q?NAdN8Ro0Eu4DO7D+KCWK5R/Jwx5k4v9ETqY6+/X1W6fITcrGOO4UPQQrOSm6?=
 =?us-ascii?Q?7XOpRIMpw7rGM7eDGwSvm+AYwtbsOkxV8QEoZNN8SeAxe4bUee6b0F+Yydl/?=
 =?us-ascii?Q?Mbeh/ls6MVymOD7WeyZrKJgewaDQ8I15MMwllnJA2FytftBdi9hf1cQW/VDv?=
 =?us-ascii?Q?zkVebFBm15qlChPiMgQozv2vaCX0EhqAeS2y7fZONc8O7NhSuNqu0o3e7Njk?=
 =?us-ascii?Q?RQTd0cNGm+50le+bhoZI8OEVvGhH08wRPclwK9szGgpXHZCR4FVdWmx/s7dp?=
 =?us-ascii?Q?o/qPL/ke5mzM4rRFb6W8VjY49ByfmwS/5bPgw9XEYvcGmpG6rdNnSTapPMf0?=
 =?us-ascii?Q?XnFDF/JzR5emzmSMgv86PT4HtLFpkkpAUeE/X4yp1gI9SCfyNBgLInHanSvT?=
 =?us-ascii?Q?l22mi8QI/aDC/ROflHDhE5IYuG97j2SBWaY56Vk7TOZC9bcd6MFbi9g6+Zur?=
 =?us-ascii?Q?A4Bh01AS++kZHsrukbkwMLSUp8RR+4M7ET78A5nPJHiNp7dolvYscZCcESWM?=
 =?us-ascii?Q?JbF/t7AJOtlNGisN4LJsQMLOKhENXp1WVX7kYDhaGppH2kA3VpvFLY5cpCOG?=
 =?us-ascii?Q?yeAAEOs+f5jFYjwEkEnjOkmAyH3yaW45yADgSj43r7E/1nw/yvWZgQmdrrqm?=
 =?us-ascii?Q?vTxrf7LBPm9/FBwtwyLepUaKvHzHsAJPC20hnobtOyg9RcHO92PuKp4H4WXa?=
 =?us-ascii?Q?6p9K2KOsFffG22GtUCLCxVKbMEf3q1i8Jjb8ARjwde/JvIq9yzzcD3Gt7JHC?=
 =?us-ascii?Q?ADjYQCvLlzmL6vlaH10Fee5EqlDYYfqwETM0RKGGRVaxTSNpIcM1dq1L4JAI?=
 =?us-ascii?Q?SLIk4ic93TqRH+oRijXLHQUEJGRJs1+0GfVpVoYqjfk6CXfygYRZ4RPAKXUt?=
 =?us-ascii?Q?WZwcAOUOj/UjcBbZUM0Cy9iLHndJtwy/Z6aXeP5pNvD518MwUK9sVhdeHIwV?=
 =?us-ascii?Q?x5V1mCcCmM1z4c35QxRwcABm6FncycuxC9/vuiK9BW64oHXwRsrvBRWnJcPQ?=
 =?us-ascii?Q?fFpo/Cs2zXKODDLPsXFI5FNzNx/EM0w4hS7E7vNiLHudaQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42981125-12dd-49f0-5d63-08d8f4a7d566
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 00:48:15.2764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ddPwW3SODqDtjKE9BPzQsSDITial4Mn724XIUUoKzpSxwwY44v63KClh4EWpQ+M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4402
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 11:45:57AM +1100, Alistair Popple wrote:
> On Thursday, 1 April 2021 12:46:04 AM AEDT Jason Gunthorpe wrote:
> > On Thu, Apr 01, 2021 at 12:27:52AM +1100, Alistair Popple wrote:
> > > On Thursday, 1 April 2021 12:18:54 AM AEDT Jason Gunthorpe wrote:
> > > > On Wed, Mar 31, 2021 at 11:59:28PM +1100, Alistair Popple wrote:
> > > > 
> > > > > I guess that makes sense as the split could go either way at the
> > > > > moment but I should add a check to make sure this isn't used with
> > > > > pinned pages anyway.
> > > > 
> > > > Is it possible to have a pinned page under one of these things? If I
> > > > pin it before you migrate it then it remains pinned but hidden under
> > > > the swap entry?
> > > 
> > > At the moment yes. But I had planned (and this reminded me) to add a check 
> to 
> > > prevent marking pinned pages for exclusive access. 
> > 
> > How do you even do that without races with GUP fast?
> 
> Unless I've missed something I think I've convinced myself it should be safe 
> to do the pin check after make_device_exclusive() has replaced all the PTEs 
> with exclusive entries.
> 
> GUP fast sequence:
> 1. Read PTE
> 2. Pin page
> 3. Check PTE
> 4. if PTE changed -> unpin and fallback
> 
> If make_device_exclusive() runs after (1) it will either succeed or see the 
> pin from (2) and fail (as desired). GUP should always see the PTE change and 
> fallback which will revoke the exclusive access.

AFAICT the user can trigger fork at that instant and fork will try to
copy the desposited migration entry before it has been checked

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
