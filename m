Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBCC445770
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5D57333E;
	Thu,  4 Nov 2021 16:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6906A73334
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 16:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnfGOiurhrjpZGgPSow4nHcLoGbLDRdadFmbl7eKpLMTDIQ/dqe7onNBWRlydRXeVzBAKcDW+DNuXPSytOv/5fC40KqkgwS6h7tJm5TJD2Td1AzKj7yjnd0MLf/r2U8WizzQxv7d70dXFMxoYsR/UF0sUuY6VhSfCPSEjulet4el0tijdhgVk69c9Ahf6b80h7l8Iza/x4WdRi9dakR831D1kQ2V1wUVreAPgeQSIC3fTZGPJDy0y4XVOvjGaASaT1jCAc1VM7Owu92toxkbr5hM59zS4WEvXUDchPI/tZTsQFahvRwOSOd59qYEFITIjg8yOZ33lkQFmcqwEEcGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTgOkSisHcVtkN4PxBawH9VE90+sw6F0bNN8YdqIdBA=;
 b=dZH3GWuzRNjtfT3Df6lIZ6RfH1373tAad4Za4bzg43Ccqg8Z0YSKhzIh8a+mcKj57fLK66k0i7nAIdP1t/kBsItT4h/QUhFoF6eYjMdKnwXFDkknEm0nJhMEX70z4zXG3M9dPT1LYyTGkmB1etLhpToCRMEzAQDUGAXzLZ0ihyaAysOCV64ZhCirIIU6mOdt9iULTL6PqPBXPErnJ8rx+7LRU2tbXS8ziRoUnqKrj5UWJS4s28GQyIVvoZ4cmFHr7n+XkJ5uZqoTlDFNDzc4ACRdo25bYBMDXFeU8ROVTIhmNlK1we2arp8JqrKN46a3ucYiPrwRkYPZxnKTcMPioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTgOkSisHcVtkN4PxBawH9VE90+sw6F0bNN8YdqIdBA=;
 b=qBkNKKeQkUHcgVHtLL3rycVo9wmz7Q5szF/1D9sElY/nbmuLM/PaHK09EnsaMdYBOKCTQdnIQBusYhsqpWNdeOtDVIt6Mth7W1PsDcK09Jc6mEademICWR8wKNIhZeagchVpts/nSi+9c5XWWNBGzcE41V3rWA9IKrLF1Vb4wDw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5396.namprd12.prod.outlook.com (2603:10b6:303:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 16:44:38 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.019; Thu, 4 Nov 2021
 16:44:38 +0000
Message-ID: <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
Date: Thu, 4 Nov 2021 12:44:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: Questions about KMS flip
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 16:44:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88ed32d9-74f7-4a4c-3ef3-08d99fb2640d
X-MS-TrafficTypeDiagnostic: CO6PR12MB5396:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5396808D0FB287BB7225E52A8C8D9@CO6PR12MB5396.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTAGclXXWrXmsyibqzB5rIGFShQXXPiQpfsUmJVp0V//IAoEaNT8ML+Dc4RR9GfvAnsSN20t+X2z2Isy5YDdn+P7KuXwwpD2OkOrr8VDm8Twz/kAr4zYjpM2uGwmMGo334H8K3InFgeBqHuWjAnvFtwzOc94dKClOgxcuUjtGt83U2WI86mkccw6mgkfxdegRVhHYjYvidGjKwyWPz19mlQ0W5Q+bYP7RkJm3KhMuXIFi+0+GgKk5kx5UcPeO1JOjPKfdqUxJqjqJiGP6gjl6nATsrksoSHUB0mN5KMKR9U4mD9s/oH/tGfEAxqBMCtzAsg4M2ukfxJnw+QxJ6EmJmXFc4s23oaqlrFs9/w+Q+DJD8j/wKFBjh01Y1wv2dB2DHCYc1Ajw+gcEfCfYrfawgeP8upyRtjS+ramNe2ErnGpft55ZNw+Kre7zDk1tMEod3NKx47A1FitvvWPx6xTj0jpfHhFdwsJQiqfddB3cxy5HgnBeWxzQ/PPyX5vQ54Vwmhnmo7xwt6aUQrhKQqkyh0PoxNEKnzWQKb4lh+zSzB2EWlR4AAJOeEQBo+TpAvtzIh7pdbXrtgLsyufyA2BTD7zYVwrw3UwUfgSOeRr0y99tIIQmDyioXJwcmv6AxG30iKKyYi811ZGh3R8oI1XkM+Ezq/LyKp1Zqma/Z0CjaBQ+2jFKvTsdxb0Py6N1nWKHLma16UwpywQyvoH4kVHNlJMgR4E/HP8/FzfKEwA9n5rXNg7HONiWVXAPNjLsTRi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(2616005)(16576012)(86362001)(956004)(8936002)(110136005)(6666004)(4744005)(66574015)(66946007)(66476007)(66556008)(44832011)(26005)(38100700002)(31696002)(6636002)(186003)(36756003)(53546011)(508600001)(2906002)(8676002)(31686004)(5660300002)(3480700007)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmpHNVhPRDNhWE1qM0ozY3ZIcVdiY0ZlL2JYM1A2SlhybUM3YktOK3pjRVlY?=
 =?utf-8?B?dy95QWR1YWViSmdOUTZ1MnhGNU9IdjFmVVgzZ1F3UW4yQk5aOVUydDdvamRF?=
 =?utf-8?B?cmludXdXRjRTZ1pxKzc1d205UlJJZWtCdk9tb1ZRSGFyT3NCK2ZxUUdjR1FZ?=
 =?utf-8?B?UzFyUm5uTm5GNkVBeGZwMDN0VGQzNCtBZVpuLzlkQ0RSemZFdlpTVnBEOGVJ?=
 =?utf-8?B?blpkY3V2R2Z5U2lveFRGczdyaVlTUWlrMDROY1Z5YjNFUk5VQVQ2NHBIazE2?=
 =?utf-8?B?UHVqeFhVS0dKYVAzWmsxblR4RlZTcUlnMTB4MkpDdTk3REVpOXNML3B6bTNh?=
 =?utf-8?B?QUZJdEJLZ1Y3YStYU0l3c3UwMXUxY3VHOTdtK0hIUy93dzhER0xENVpHWVRU?=
 =?utf-8?B?d25sZGdlQWtjTVdTM05jTE42R2tZVzJwVlJxR1UzTTNTTnU1TEhWMlozUDVB?=
 =?utf-8?B?aS83cS8vN3F2YzlQWDRZdURmSmJacW1aRW02NExRc2lKMjdFMkhwMWtqT1FO?=
 =?utf-8?B?eERCS29sWnY2TTV2RlA1TS9idi9IUWdNMjRBK3ZSVDRpM1VzbEZDNEJOcGFI?=
 =?utf-8?B?Z2xzT2s4K080SXMrcU45T3NNTTRvTENRSHFSL2VQUktWSExUSk1YaVhQRDJZ?=
 =?utf-8?B?U3FvUXhaMjN0a1NxSDgyRWhpYmpBbytSSHk4Y20vRjBOaXJHNVFWeEptMjAr?=
 =?utf-8?B?Q2NKQlhLbFdrRXJlb2l1eWFLUHNNUmZ6S3pCVXBiS0RWalJJMHFaQkM3Y3ZW?=
 =?utf-8?B?WlpxWmZndnh3bGt0SExuYlNLa1ZxMFRVOG1XZmFrejF6N1pIaFRhclVvYVZk?=
 =?utf-8?B?bFlMV3c1T2Z1Z1BpUW1leFMxby8vTE91M01nUzlPdzNTQlJrSXR6Y0ZOUzc4?=
 =?utf-8?B?Tnh6K2xCRmRERVhQOHVXY1ljTDVCKzVhMWswdkdPR1pzbnRBYjRSWWFKYzFZ?=
 =?utf-8?B?NjBsb3FWajJnOUEzbkJSaG04QXZ3eUJqejNhRGFvczB2WnJBUnlkVUV4M0Y0?=
 =?utf-8?B?RFVHWlJjZUJwSWFSeDk1K3NOLzQ4WnJESmJtbzMxK282RVFGdysxMWdQT3Jq?=
 =?utf-8?B?NnVBUFBqSWo5cThBUjJpTmlSRXoza0NWMDJzQllhN0s3MWRaUDlLNW10eDRJ?=
 =?utf-8?B?VXJCYXlSQmN0aVZCNGo5Sm11SHdGa3QzQmhKbnBwckU2TVhUVWdZQS83Qzd6?=
 =?utf-8?B?ODUyOXpQN3B0cm9vRW5zZ1dYckcxNndjWmVlZGpjUVhkMDg2ZTdIZTc2VlBP?=
 =?utf-8?B?cWJFQ0NUalpJTzA1KzBFT0YzUjlBdXVqOFE2TDlFdndmcC94ZVNEaVMrSnNQ?=
 =?utf-8?B?aTVGV3ZiOGVucktQeVM2K3daN2xEdjNkQy8vYWs4cEF4VFh0NTBJeTZsS3U2?=
 =?utf-8?B?bGVvL05OZjBYZVd1TE9VVW10dmFxWXBDM2lxYytZZlM2eHhSRXJPMXNKS0E5?=
 =?utf-8?B?Y1RJdVhFYVV3SVJDM1FDMGdLeWp1WTF0Q3lTNEE5dnZ0R2lTTjVIZGNReG8w?=
 =?utf-8?B?MmhVKzlhdUdwcVhtbTEvTTd3b3gxQTlYNDIyendwdDl3aHVoOEJoTXVWbWlT?=
 =?utf-8?B?OUZFb3ZES3VVOUY2N0tReVUvUWo3bnlnUG5YcmFaUUZjTFVmYldmTEwwNUxy?=
 =?utf-8?B?UCtjRWZaY3RiK3Y5Q3NRMDJpL2MrUnRBeUpITThIcm1iOG0rcDE2NXpnUEFj?=
 =?utf-8?B?aUMzZ0U5N0Q3VVppWnlwWWVROHAweG1LYzdMMmRXRzRjSUY4bkFPbW9nK1hw?=
 =?utf-8?B?K2pDVHpZaEgzdGlKK3lGTVJmdzZxTDc2eFoxNWZkdHVxYWJ2d0RXdDF5VGtQ?=
 =?utf-8?B?RTJxbnluMHpOUG9xUzlVQndkSXFUandOOWNwNXpmQ3NpVW13aHhuSXlpZmg0?=
 =?utf-8?B?NmJDdzhpbVZseElNaVB4SzRTZXdtZXhHRUt0RXV3cEwrVHBpY2xUNmw4NUVl?=
 =?utf-8?B?WitsSHN4SUZuaTRuR3lodVBhbytVYW42UWVIUHhDRUV5UzJjdStkOUhZeHdM?=
 =?utf-8?B?emlUQWR6S1VtSTRuQThheUFxWUhrODhLenBBT2JjTU1CK0hCcjFRY0lBTnFi?=
 =?utf-8?B?aWJ5TEN6V2F4YVNMSlNiUUFvSVR0bXNxZDIrSlI0Y1B3dmtCcnNZV3FETHVS?=
 =?utf-8?B?TFovUXIzcVFxbnpVeFR3eVF0Z2NQVHhUMStKTE9jQjdyN0JyelN0TkpQWUFw?=
 =?utf-8?Q?VizjzhkehGKPz0SMObdoYeU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ed32d9-74f7-4a4c-3ef3-08d99fb2640d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 16:44:38.4127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgVUP+e624nbxTAPyKIMTmWCU7mbSKBRMnPbNuWq7UhAyf9l83i+zFdTnf5t7OL2VElFvTDKCIvO1Ipx52mXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5396
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

+Nick

It looks to be the old drm_plane_state->fb holds that reference. See dm_plane_helper_cleanup_fb() in amdgpu_dm.c.

Harry

On 2021-11-04 08:51, Christian König wrote:
> Hi guys,
> 
> adding the usual suspects which might know that of hand: When we do a KMS page flip, who keeps the reference to the BO while it is scanned out?
> 
> We are running into warning backtraces from TTM which look more than odd.
> 
> Thanks,
> Christian.

