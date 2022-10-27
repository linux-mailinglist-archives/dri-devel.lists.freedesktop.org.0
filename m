Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B359860F122
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 09:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FD710E317;
	Thu, 27 Oct 2022 07:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E1310E317
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 07:29:39 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R61ruU001007;
 Thu, 27 Oct 2022 07:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=jgmb/pFy+eki/GErthEnCNxsmgEcLEkUY4f/I1DtZcw=;
 b=KOGC3s5MVHep/G4dqk8I2reuuQe6ACVEJD/q/sWxOUzEq/HtjpDsJdcC+Zu6xIZp044P
 8qAVr1KdnFc4KhmAnVcifCzuYmo9VmJRgckQ9SvJl8YoA8Hn+Y308uofv1T/H+/y1tth
 YN8CrcoNSKRmM4iDFpw097m0MGNRod9oCtsRS8bFfoL6jzhqN9RUjScvK3u9PgIpl1Kh
 YAr6DtuvVH3oAT2zFpTo7OuMHE8weDRrXAiNOTCGnfsLpFh2eOXcSRTd2pWGmfNXJhys
 g5op7ktpMYzTHMIBCneyYU3TSWbSLJnsniFCJscA7PmMVvK56vgTkxG9Am9ObmClniaW jQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfax7s444-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 07:28:25 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29R7NIZm011574; Thu, 27 Oct 2022 07:28:24 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagqppme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 07:28:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFqlmugkagRK9iS4dcmkVKyygWXcc2dcSNNOXd3uhfg6nUUroCwQbIx+FsBG4HgM83H2IFgQz8seNDW8D0XTbGMwb1bhNdWw4wZaW74vN7pfZWM3fb5IfR6KsDeIe1ZPHYBJxTg1SA0i3cML3BhXHgFpGnswbpf+l4DrSuoq7RvTROrDIJvZQZBKcjdtN/mKgym9VfZ1+ILaWQgqvd81JMosoiuSMGulrMBAF0Ysz5gt8UAAaNtZlXWsQ0VYv9RT6WM+1CAB7ydTb2ObagsMNB+zRBsM47Seey2jHmE1MCXMcHk4zR8HYNplYpa1P+NnOfIpzSHu6YX4/E7mStYqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OV1z27KXM0Gl73c9GHjOytwOw5y5rhOj9cgyOkbcJ/g=;
 b=VMLLpBe0eEA+joP+N5xVPeB7nyaiKXkGQ+UiLTsrB+aOkW4TfnAI96hfFkwst5VHMcTURT78rZOLWoBNrsZdI35ka5uclFShMTsBn97Empmahys/gACUpr1g2qqBoYdhQ+Qq/fx1SEg2DJRpou2AVq7ZsSX/ds2BWCmpIRocQYgHPnl/K7vExwF+KL+/1eko1qvffdOfJYXKmJHX3f/3s+mXqvCCE1bXxTLY3QeSa5rmrKDq2PbVLkdYjN0kemZ/B5/OKzO/4cmQFgV8jLvAUJHu/U2gBJbTbfNK46FAIMTgS6eRtq4BZKosISTbwXJqm8aQzsrNg0JYHtIN8SBFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OV1z27KXM0Gl73c9GHjOytwOw5y5rhOj9cgyOkbcJ/g=;
 b=RJO0LG9NFcDV0CdZ8CLOnqAwnONwo2/VAcRLSZ486Ey8rDbR4pzGkLwgFsfTTdu1IuSwPZPYQka7RVglY6p+44riL2wAHuONXpoLB8+XqiZOTRL7OSHzmvAKno4EG9KTX0tXNEA/EgOtMUyY7QnRp5gJ47Rklg4Lzn81vFOKK2I=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by IA1PR10MB6147.namprd10.prod.outlook.com
 (2603:10b6:208:3a9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 07:28:22 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::7dee:dce8:921f:d623]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::7dee:dce8:921f:d623%6]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 07:28:22 +0000
Date: Thu, 27 Oct 2022 10:28:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v1 2/2] drm/gem: Check whether object is NULL in
 drm_gem_vunmap()
Message-ID: <Y1ozCWTco6dzIA7J@kadam>
References: <20221026224640.7542-1-dmitry.osipenko@collabora.com>
 <20221026224640.7542-3-dmitry.osipenko@collabora.com>
 <6b37315d-74d0-713a-3544-b8d4c873488d@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b37315d-74d0-713a-3544-b8d4c873488d@amd.com>
X-ClientProxiedBy: JNAP275CA0047.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::8)
 To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2358:EE_|IA1PR10MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 958f0c91-f514-4b05-c4c6-08dab7ecd38b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbb1e/I0gguCRwp5BRcW1zBQ9dJ/FNxbrsKyoFAQL/TBE7Ei8hjorjfqJHf8yvAYPFm33Fa2J/GuDzYwtvDGF8IfQi8gqGaMtDQoXvm7hfmVmnrXdyq7ATykzuV+xDZ+VFZobzC4HmqqyF7+hPsH26t831IPdEtRtlQH55Fgbs5xbMxUyjBS1rq2y9I+R6CvLHh0uP6aaWFzO/ziglBFQN+Th4zG/n6I5P7yjAL3trL5SJ9BBSg+CDi1TLDyVJu2HPCuxEpZ7BI9IYVFwc+IAZ5ec5AtZvRsK9SqDm0xMUEapy18zkvvAxoAQrR7/F7u3/MfNMFA3S27lzv3/AJxG+JBtvEKQz343lFKnR+llvLVXv9oioRKyEwss9r1sdMyXcpLZW1RhHuLBnG7yzr25Zl0Te0x23i6rWKGgetovuDCzyFlHPsjBcDjXqvQdPj9hIwbnJJHsjXbEnAQTTn//PrveE/1qnBs1YSS/s2mXfYrV20kxDAwpInYe67xCfb2QnkXmIoKzNxbEETH4X25BszO4cEfwWkr6z9bcJVVpuQTY3jszmKRIa/WrSS0s82V9mP8gzgLx8aTHatMeEaXj5c8Lo/AoHkZDa8JPPHJQUWkzmABi+w0dEuRWnrZ2B7tmRBkk0uzjOlPJj9XRXpTYqS2uEpXah1YrK8RJLiaW8aIHvzNtJUJ6so1NJxS/DnbvNwR07WyGznS/GldmUyzc+7mVXQdyJp6oTM/rierXxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(66476007)(6486002)(54906003)(38100700002)(186003)(44832011)(5660300002)(66574015)(26005)(2906002)(83380400001)(6916009)(8676002)(41300700001)(6512007)(316002)(4326008)(66946007)(66556008)(966005)(6506007)(9686003)(8936002)(86362001)(33716001)(7416002)(478600001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hIytbyyUacCJdS/CBD2vJR/0t892My8/I4mbgd7nwYl59btZnqaOVTrQSg?=
 =?iso-8859-1?Q?lmiGcrIAqsZqcpoVHpOCKde0vqU6i22rKFKVTi8ilFm09a3Xol1Cr0/Epp?=
 =?iso-8859-1?Q?IFFiY8i6JV/0KTBrrbjRlgSFLNHOB3AzkSiARmRTPmH94TlMd4BcMeSemr?=
 =?iso-8859-1?Q?rqX2iUS3vvgVTlMVLZXBD9dZrZLtqZowXAjivnwG7WzvVhyBxPXYo+6F+X?=
 =?iso-8859-1?Q?mCvpk9b/Rb2Y5Xcroid96gX0n6wC1xh6EDHPkMXME7mtMZJ27geX68emUO?=
 =?iso-8859-1?Q?n8XktlfCjY0gHqsu4kkHbQw4eRVE5bUKwhfV3zLqE1vhnkxkCSXFfbpWfy?=
 =?iso-8859-1?Q?emVSQFcq3xD91YzJCmglP6PPcDmgIhUE0p9Ay3+Jq8KQ/Seigai1Lajp2Y?=
 =?iso-8859-1?Q?UaSH81qtWC01GbP1O2ELf9afCEUewET/mqBfR7j7RJhzLRZFGuORHaDagz?=
 =?iso-8859-1?Q?pfzlddBGir3twB1ARVhLFQyIX3LLV7BLbzWIXpOK0Rcpd9l7pLt89WRw33?=
 =?iso-8859-1?Q?FktdDnPEgcvq755fPQgZ5wR4UwfjOIUVT0YzFfu0cNOwGx+XeQXwzrvnOb?=
 =?iso-8859-1?Q?TKO9aCmNu5EGLCkpmr5Qkfqiu0fruSoTaXAXivXrrqxknzHxw7lg5aeTra?=
 =?iso-8859-1?Q?B5HrpU4Y69GyQ9F7gH5FVW7zNnikJc4/p9EuMky8qtUzRK9kTuiPLYzNOK?=
 =?iso-8859-1?Q?viyX6SiYWC3ISHNLrmBUQO23KVJ4Z+4VhtAc4aKApMYG9lYCMAUu85E3BC?=
 =?iso-8859-1?Q?967Fb2O8FKmrQpSa4xkbnfd3GQ1T1r8BYYNdd+VDqErM9dmx04k44rGL3e?=
 =?iso-8859-1?Q?yIfcR8jCdEIZZsZVKYz2gzs+mtBtYMJXZBNPuNT6fRCTTUPGlKUivYK91W?=
 =?iso-8859-1?Q?9pT3IFkqZH0cRrlrc3djSqsnxCbk831vfU+eFxMRKEZRpvrx4JJVSOXjp0?=
 =?iso-8859-1?Q?ZRz5JHvbWVZZWZyFaaOwA8T67yhNwtex38p5OhrpI3CNrVYV9tQAtoEUKN?=
 =?iso-8859-1?Q?WsYcEOwn/XBf3krL93IASftpfe0Quo3MUh+4mtN3rOyyepKE2q4ryD8bhe?=
 =?iso-8859-1?Q?WVrTLJUYdkYraQAFxwMDXvqSrv4szymze/2P54dzsUS2wnG/8M/nE+s0fj?=
 =?iso-8859-1?Q?krO7ZngdizIBjmClMt8qKTM394tOOZCEdhwNyygAnu9qwz3bmzkDig/12b?=
 =?iso-8859-1?Q?AeA2grfzomJoPDa5gZLFDcM5n5aO575GXt8hUpRrxg2Fji+GYQINqQ+HeW?=
 =?iso-8859-1?Q?fpWYBMmkEfXeQIPNCgOmzB7E4IlMm5mOr0BG8WkTVu/uW020Pvi5sVeZeW?=
 =?iso-8859-1?Q?PJ22+cpawwGTbDdQBL+3CzKAb4t4OLh1Fh/ny2yFNkJIZx5wFWhf+GGw2J?=
 =?iso-8859-1?Q?TFR5Z2O4K1fnmlZkRZKWb1RW99dGXLHSbH1WU4KSs6IJH9xQnP70gXfca2?=
 =?iso-8859-1?Q?MnIOGJUQr2WB0LtnrXMgw702IkNwLI1GGgUsVv5wIw60gTJadbSlBh535q?=
 =?iso-8859-1?Q?mO7p6TsZO0dQb/SM60hUDxppWIk8lFERo1G5tWHZroTHWNoOV/Y+j5su7r?=
 =?iso-8859-1?Q?RhMHBK0UMUuuQ4Lr/iEcTcZCm7FvLV4Z5RstBU7BZx1EcZXMNcINkO6CGv?=
 =?iso-8859-1?Q?kWRk7Hqm6dwjXwEN3uBOKGpRt/ENXasaCuXjTFaMZyY5/2j5U5fsbixg?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958f0c91-f514-4b05-c4c6-08dab7ecd38b
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 07:28:22.1757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BYjixnZkhRr8fu9oR8drUZhEfvupLydExubSQXHXty7uvjr8zytsPuN/2dw5IgpBtFVHN+x1+jKWuKfYvnfi+aJwWOABgY6GuY7AqSR3u4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_03,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270041
X-Proofpoint-GUID: GSfmEYrhINJ7iAVEMA5xzjSrQEweNGPI
X-Proofpoint-ORIG-GUID: GSfmEYrhINJ7iAVEMA5xzjSrQEweNGPI
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 linux-kernel@vger.kernel.org, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 08:17:31AM +0200, Christian König wrote:
> 
> 
> Am 27.10.22 um 00:46 schrieb Dmitry Osipenko:
> > The drm_gem_vunmap() will crash with a NULL dereference if the passed
> > object pointer is NULL. It wasn't a problem before we added the locking
> > support to drm_gem_vunmap function because the mapping argument was always
> > NULL together with the object. Make drm_gem_vunmap() functions to handle
> > the NULL pointers better.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Link: https://lore.kernel.org/dri-devel/Y1kFEGxT8MVlf32V@kili/  Fixes:
> > 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap
> > operations")
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >   drivers/gpu/drm/drm_gem.c | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index b8db675e7fb5..ee0a246ff4ac 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1175,11 +1175,11 @@ EXPORT_SYMBOL(drm_gem_vmap);
> >   void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
> >   {
> > -	dma_resv_assert_held(obj->resv);
> > -
> > -	if (iosys_map_is_null(map))
> > +	if (!obj || iosys_map_is_null(map))
> >   		return;
> 
> I'm not very keen about that. Calling a function with all parameters NULL
> doesn't make much sense and is clearly a coding error. Hiding that somehow
> doesn't help but rather makes things worse.
> 
> The only execption to that are things like kfree() or *_put() which work
> with the lifetime of objects.
> 
> Why is the static checker complaining about that in the first place?
> 

drivers/gpu/drm/drm_client.c:240 drm_client_buffer_delete()
warn: variable dereferenced before check 'buffer->gem' (see line 238)

regards,
dan carpenter

