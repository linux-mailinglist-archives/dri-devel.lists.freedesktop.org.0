Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6E2A8267
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 16:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDD56EDAB;
	Thu,  5 Nov 2020 15:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108306EDAB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 15:41:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grGVGagrRRYLgeK7/eQ4/nN33xNhK9n0wWprNBl9YGqi5TOx7ds1SjSnKD5Ig7uWeDj5zikq0hZ0YyMMMOYLkA3BwyCLivaNK/Z4OrvjPjKRoTcu1ajU7N9hgHsggQGDZk0U3QFWwdw3gutzajHWLixr5H1zyuBMajp60KlyVWETDPhUZYLFQkeMcueTNetSnxru+pHTP5hv2Cop0lDSQ4cemtEodKroWWrTr4qxCDmOc+QrN+Oj762PaWym4HmfzyIYMQ8n6kXK/1fF7FZX65Q6clngj/gXbNxbF1DCDrANgJo4FdcZkF/YgwZ1uu6VNVGkAp6U+u4zEf/kSbkZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71uWkL8LfeyBNwuIO/sy36tEEpfa3F6WxL+RSUKrKV8=;
 b=EG5v3lH9jhKNrYSZh9LB5ihFfDFB7ofIsUFDW83Y5eMZN6DT/yCPyAh4B+vaJ+HX8fav9/PxoKhZH/yUcG/ipP1ahQSjgQh1E2rOirWsCTU75ieNeM/JWeSh4cHdzAFpRJ+1Wbop8P9fpDgwy7mZAHejt8giTCWkaedVBtRqtbEG04dKWFac4NyQ23of63GqffvEOK8NaKZJUdE0J/hJJJ0c1mRlmYk7bQ3zNAbRUL8KpBfbLXGmapMxV+dao4GO9ym3D2qEs6jM3/tnk+qtptuODFjL0MgdEy/tncrbUGlW5K7ubBrzVwCru3XpiAPqzKlPMKxGghd74o1GWJtKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71uWkL8LfeyBNwuIO/sy36tEEpfa3F6WxL+RSUKrKV8=;
 b=OIzpzwRnDCi1oQ8kWOSyFJAXR9tYVfblc95ZuVRWQSwwnirtiF70shKIpz7g0QpGlVl8E1B9ZynFJIHzeJ55neQp2FFt4TDExl+8YZQYQG4UqWds56UKNPnps/GZ25tckRzZVjDaSLcssBrysrih8WzUE0jdPOhQBcINrgbTP7g=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 15:41:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 15:41:05 +0000
Subject: Re: [drm-drm-misc:for-linux-next 2/2] drivers/dma-buf/dma-buf.c:1186:
 undefined reference to `vma_set_file'
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <202011052343.iOH9oZPH-lkp@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3687eb25-8c94-4a08-9917-0f12d57ba76c@amd.com>
Date: Thu, 5 Nov 2020 16:41:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <202011052343.iOH9oZPH-lkp@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 15:41:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1fc68313-f52a-49d1-8b63-08d881a134f9
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899E36A07890682B18123E583EE0@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDpJLbY654By+VjXMqtgZKvkvz6F1RChHgpDdWNCySbyEoM9pBvv+5oQgLVH0jc6ly1cPcqYl3y6rikwBOcwjpiM0PU1d/i6tq1t72EfRGhi2R7AOk8zRiRUoKhy+ey9JzJQoivM1j6LOW9L4OZcrfm+E9bdfhhe320vWdM4HtwIfzc3Yo3dQccuF2/LbJcEB8n2WH1wNul83ZSTww43877Rngz2buJck71OgfeRaN7jISKtlnchxtyiWQNLBIJe+wvZmJTNmSALCiapGTleXd9L0/kdXznFykXEqeBE9ZwvWxNa5kQd7/I9OO6FGPAcwVRVaKi5Dq+Sv3sxvPic5PUrQAWPfRCU5iWsWUNr2DcTwmXh2k2WuS2E75Iu5YkdpAdd0k9oRHqCoup33LoJaE/+3xRk+zZRpgz/UtLB/EYn90TsGCMVzIF7ITvCp5mGaqUQ4XEX6cvWamx+BiVZ/syndQP/Zk5cunvzutYQ9Lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(16526019)(8676002)(316002)(8936002)(66556008)(478600001)(4326008)(45080400002)(31696002)(186003)(6486002)(52116002)(86362001)(2616005)(66946007)(66476007)(36756003)(54906003)(6916009)(6666004)(5660300002)(2906002)(31686004)(966005)(81973001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rkeXj9SG0nSJfrLsx6/Lo9rmUPgSdtWpcTv5zAh2MDeHo0ApJWWAbpUjShGOfNJmAiaCTj7cPA2sby8hQ0LSAFTeCzlv4YsOhMQ99q8YM1HZi4Q3wSMmH2XCrZfaY/EJ4gKd2gy9fQxL/bcUrcfVkA6NVs5gsfnYqIfMAv2DAWZ339OYyL9zJPxDU9v5xA77OfOtXdLKMdWsun6UGUEInTLyN4mgZTqYRs+yaBOv4ztWtd2Zc0/c/POiLJwRuHuD8auZX4LxVEHkoLLfJd8j4fmdaBtwwjxmJserbl2P01g8ZqLKghJ1Y1PyzHJLvukpnY1zmeH9Yc3G5V9eZquuRqTMA31uF5S7qdO4fgElFGBr/0sUJ+R9HybubLPhyMl6uimaLj9WIf/Ouofb/42LsGxJvrXZNoKHkq40TtPxE7+pqqNa98OZ0iwZGKwoN5RjBPFMVyFf1FzHbqEtv3Bh4lXiHrlFBwFAIZ2Ol1JlpEbSzG//PsWPuqemVx64Wb3lt+7AEzppaQkDPQ4ss0uaReD5WqiEr/0vQTo5AQBpusfmWomoV1Ueqn9R7FeYewNLnNpsmg0GYFNq7mptHE710RN9sxs5RFw9BPLliaol+VjYBHfo2Yv6QueSfRJ/Rwr3kx7JfG/Kp983X2wQZPmH9YgQSrvohz+807oRLFJ1eoj+tzGwnVKhqdHNfdbOYnmFvzZF6O2pIN7+3qQF0yIr6g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc68313-f52a-49d1-8b63-08d881a134f9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 15:41:05.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fmPNpyisCglrOkJR3H9RuAYjQjjAPj0NdCjbpJEM2gH6xvQbOmaRzEL9/nNQNkN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Guys, can anybody help me out. Why is the kernel test robot complaining 
here?

Thanks in advance,
Christian.

Am 05.11.20 um 16:26 schrieb kernel test robot:
> tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
> head:   2b5b95b1ff3d70a95013a45e3b5b90f1daf42348
> commit: 2b5b95b1ff3d70a95013a45e3b5b90f1daf42348 [2/2] mm: introduce vma_set_file function v4
> config: h8300-randconfig-r031-20201105 (attached as .config)
> compiler: h8300-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2c3b39afc651426aa50608d8819f48fc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637401871204724096%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=dK2txO1WerkR7SiB5i9kcXjbJTMlaQ1Q6dbK1cb9lnE%3D&amp;reserved=0 -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git remote add drm-drm-misc git://anongit.freedesktop.org/drm/drm-misc
>          git fetch --no-tags drm-drm-misc for-linux-next
>          git checkout 2b5b95b1ff3d70a95013a45e3b5b90f1daf42348
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=h8300
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     h8300-linux-ld: section .init.text LMA [00000000004da400,000000000051ebcb] overlaps section .text LMA [000000000000025c,0000000001069997]
>     h8300-linux-ld: section .data VMA [0000000000400000,00000000004da3ff] overlaps section .text VMA [000000000000025c,0000000001069997]
>     h8300-linux-ld: drivers/dma-buf/dma-buf.o: in function `dma_buf_mmap':
>>> drivers/dma-buf/dma-buf.c:1186: undefined reference to `vma_set_file'
> vim +1186 drivers/dma-buf/dma-buf.c
>
>    1150	
>    1151	
>    1152	/**
>    1153	 * dma_buf_mmap - Setup up a userspace mmap with the given vma
>    1154	 * @dmabuf:	[in]	buffer that should back the vma
>    1155	 * @vma:	[in]	vma for the mmap
>    1156	 * @pgoff:	[in]	offset in pages where this mmap should start within the
>    1157	 *			dma-buf buffer.
>    1158	 *
>    1159	 * This function adjusts the passed in vma so that it points at the file of the
>    1160	 * dma_buf operation. It also adjusts the starting pgoff and does bounds
>    1161	 * checking on the size of the vma. Then it calls the exporters mmap function to
>    1162	 * set up the mapping.
>    1163	 *
>    1164	 * Can return negative error values, returns 0 on success.
>    1165	 */
>    1166	int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>    1167			 unsigned long pgoff)
>    1168	{
>    1169		if (WARN_ON(!dmabuf || !vma))
>    1170			return -EINVAL;
>    1171	
>    1172		/* check if buffer supports mmap */
>    1173		if (!dmabuf->ops->mmap)
>    1174			return -EINVAL;
>    1175	
>    1176		/* check for offset overflow */
>    1177		if (pgoff + vma_pages(vma) < pgoff)
>    1178			return -EOVERFLOW;
>    1179	
>    1180		/* check for overflowing the buffer's size */
>    1181		if (pgoff + vma_pages(vma) >
>    1182		    dmabuf->size >> PAGE_SHIFT)
>    1183			return -EINVAL;
>    1184	
>    1185		/* readjust the vma */
>> 1186		vma_set_file(vma, dmabuf->file);
>    1187		vma->vm_pgoff = pgoff;
>    1188	
>    1189		return dmabuf->ops->mmap(dmabuf, vma);
>    1190	}
>    1191	EXPORT_SYMBOL_GPL(dma_buf_mmap);
>    1192	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C2c3b39afc651426aa50608d8819f48fc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637401871204724096%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=YS8NkL2Wf4ysbsibG3a3MAGp8zsEopbazO3ARSAPezc%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
