Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8E60D102
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 17:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB9C10E3F3;
	Tue, 25 Oct 2022 15:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3F410E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:52:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0950sOyC+gbSRapGjfVXcEdlJIpkIJ853X5cEZ+Xrjy9sPoHtmPU6xmrfTEAeG3Rm8bF9zexMTtBTD/fi9J1UdSFZTviH+07d6Oh/lflsJlzSJIEraKoo2LpAovuBhWtZs0ITHH1VBey2Z8oP98HIO+s24z8L4XDzNj/a8914GM9dGKbUWPeQjazLpMxbsy8fOcMwdYAgZ5vjSwZaxwdsLTg4awfbnryqfLFGNHhDJBzt61rPeWZ2bsfjcnRG9dLLg6ooAhAqmMEm0tMRXYsE13Bn2k5R4IX+OysnDAgV8wj0b1J4FzvFBXJ9xMJ/XiYb9pQBhxTJU/M57toe0IgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+qaerH1nodJ5dCQpmPcXTkO9LE5XFMnwgs52f856ac=;
 b=EO5dXViyYxgehufSlpP7pooC0yWm+0dOn1OGqfk67+jSBgo4EZMbL34dou7w2tJg2dp6+adqYvk3hp7GccOVN1VYDCCutNK3sk+VmKPEluqJCmaQ2X57wP1V4kuuoYPRQ0XRf3uRMRO0vb89YzpUfyB/FRZNnmUBlvot8lDxS6slaNkhwS95c0P4bsZF6ryLvAkuMzZuVDVvg08/LXbnO3pECuDFszDKgtOksq+QUI3ga6QTMKWA88/Utr1EaagZhFienVCueT6/16GFc2Ytx6cXIZteW7lDajXQx5cT09h9d8j6VesbXYrF0KmCnIFuPbWXO+tJ+mC7FK4Yzr+Svw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+qaerH1nodJ5dCQpmPcXTkO9LE5XFMnwgs52f856ac=;
 b=5ssGsqzuEvf2OyjSCoJVYTTv26p6CmPrRX/FSZhRTsuSXGc6Nrc54ggtUg85o3k9nC6PdOnneONKdjXOB3uvOYt8VlE1ptFOBGkA9JYDk+hXqdYf4Ao2AhOKrFZq/JtkPXK6GR14Lni9uIcmot+riPMIzgJX46qKPCsTuVYG8G4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 15:52:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 15:52:20 +0000
Message-ID: <24bbc516-6055-02be-efad-958c1d94153b@amd.com>
Date: Tue, 25 Oct 2022 17:52:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm: remove DRM_MINOR_CONTROL
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <20221011110437.15258-2-christian.koenig@amd.com>
 <nrRxPQtWoC6aCzSuZn5fl7wccdhP9fOpc86YTIJUlck9LK2NtPTNb5QeZa_Gsl0PYpkTn5FiCcEAzsm_C-ypBEUP4jz4avyuUwJ2P6jmX3w=@emersion.fr>
 <2701312e-975b-bfca-0cb5-fcef24f32e2c@gmail.com>
 <20221025135903.elt6ayurfynnsy6p@nostramo>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221025135903.elt6ayurfynnsy6p@nostramo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6d042e-ae67-433e-426b-08dab6a0e66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnFiXt6VPaLlBbBPJ42Dg4A/UjewiAN0hYA8Gi1rXGy4oeSwssP2deuhOIm8JzHlvjgw1uRCBYEx1Vlz3yCMQFDx6aSG/saEqLaSfwK4Bfu9QVIuBNvxFIXNiWOnDZ9RjWBfk7x8nEu6I7IYTyYa2tTqbxROrrbiRPHIXZfMR5oPy6befloNlMkZYkNG13mSRCMztJuhtt8ye83BmbT2Z8i+qz1tQoH4mY9v4PT8k+rmJmApXiTQuJ2VpcTrqFpJMPYt6okuv5/mzvTJcre8lHcerVdBUEOgFeM94VCOskHP/0sfIStzDeWGEcs/QuFbg1wRuNO4mRzgBrc/1Dsq2+oMWsuxuKdwdkqTSxpccYTicBhc2nf2wZLqRbYjGSeLHHGIYjQrGIViLaCXjpr2PJof41ao7zB4Y6XAmp8tT14iBD7Qs5diD1pf+eh0UV5C9RSVrhjs4P0IIz9sap6zR44aIfL/4Ns+mMfUflA25g+hbJFAdBzb+XR6LcNy+jRzC9WJ+USPLzM4QpSiJnCcVR6go+EDimL0K4GWCJMgHmNSjDJgC3EavqM6YNsP0xYrmJKwkFSCuZfHoIOpAQN5igEQZxkC6vUysNYwJFnW9h+s87OE3WnAbpj4UkkbxtZOeT5sOFFdU0yVfaExAQagb8/DLcQDJarjIWJ7kD4NL2TPGeqgz2odfaoNJ0kOFcAL0M3hrxiWy54ACS5/uPL2UPxpCVZcpCcoBAD2Bi+XkA3jm0XexJLHl+eQV44QVaermwkiXBIhajkloO0hjsRb4tdlbpH106n2MkXV2h7Z4u3bRbaaZWGs9yedNZDUFcT844kOqC/YWIw3xaCwsz46fW813aHWURWV/g02CfHBpwE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199015)(110136005)(36756003)(6506007)(186003)(2906002)(31696002)(41300700001)(38100700002)(4326008)(8676002)(66476007)(6666004)(66946007)(86362001)(6512007)(316002)(66556008)(31686004)(2616005)(966005)(6486002)(478600001)(8936002)(45080400002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JKM3oxeUF6dTBwSjRUcytQODJ2M3p1emFLL0wwZFlKZnphQzMxYnJtMFdD?=
 =?utf-8?B?akRkZG5ZaUpENkM5RjJaUWw4RVo5Q1ZRL2ZraXdOZUt1YThyNU13ZTc5WXgx?=
 =?utf-8?B?ZjRRcmRVSWdUR0RwL0dKQnlnUmVCOVZwWDdjRFkyK2w0V3pUa3dVTjdDMEcz?=
 =?utf-8?B?Tk5oQ0YxVHo1Z2ZyVFB5LzlXVzNPeVJPb2pNSkI3R1hnRmJOMko2N3l5MHZm?=
 =?utf-8?B?Mk5RdTIyTmF2OWVkTVQrNmQxdForVGc1MWhHVnZ4Z2xWeC9HOVNlTjU0Uk5H?=
 =?utf-8?B?WXBWOEh5aTBkVVlTVnJEa2IvajFmQ2JOaWhBQVhmQkR0aHhkdlp1ajNuMCs2?=
 =?utf-8?B?UmU0QVNrTWZnSFlVWlBoVWlmRkxhbCsvMnhLNHNnSklHMEgvVGhxdXFjcHhn?=
 =?utf-8?B?VzNkWWdKdmNmbDdKYzJTdG82Q20vVWZwY2dKK1JROTdIVHlmWUpUc2I1SCsv?=
 =?utf-8?B?RXZZdnJPSUJ1WFAzMHpmTmdjd1pmUy9DVHZnU2xOOGpXa0pkVWtkZnQvMkNT?=
 =?utf-8?B?cU45VlUvT1NUb3FBMlM3K3lyMFRGN2p3M1J1bjYrU0pLQUxsOEU3WnRQT1VH?=
 =?utf-8?B?VGdnMnhkc0Z1RHMxeUxwVnJCUUVQRFhZdWpQZlIxZEpWTnlQdWZDS1oyY3Fh?=
 =?utf-8?B?eVBjeEsyWk1sNHVBNUpEYmYwVlpCV1ZMaXdtRlFSZGJKdUtWcTdGVi8rR0dU?=
 =?utf-8?B?TjhPYTFheWdTYVhDWnQ3TFhTNUw5Y2hCb3B2dU1OMTBFMEo0V3NtKysyaEcw?=
 =?utf-8?B?SU50d0lHZlU4NW1oT0k4ZUduZVluYWlkZHFaM09IcE4zZk5mcXhJMnhqUkhL?=
 =?utf-8?B?cTQrNnRJQUg2QnErQVYrbUwwZFQwRFhSQlRHK2wvU3QwWUZVNGYvc3BjemVB?=
 =?utf-8?B?YmV1cUxVVUw4ZC9tY0FZTjhYU212TTRMRHcvbDNzT0ExWS9PWEtXUm9tZ1dz?=
 =?utf-8?B?WndSMGtkOHRGZGk3Y0UrZ1lsUHA4UHQ2dlhXaFhDSGpHT1hoU2o0ME10MUlp?=
 =?utf-8?B?c0RXQXlXcE5ncitRNHZ3cWwrZWNsWjN6bHcza2w2YVF4eDRuN1JzOStOcHl4?=
 =?utf-8?B?S0o3YTNUV3R6YTZsR2dtSitFUjU4VWtQZVJlUmlqUE0xeFVDVVpNeEhjOUZE?=
 =?utf-8?B?THZZbmVna0hVSnRuOVk3aEpXVEk1c3BLYmZLVkRabzV5bXdReisyMExNWnBP?=
 =?utf-8?B?ZjMxYjNPRFNCa3NMamZmZWZXZTN4NHdPSElieHBweUllWFB5SUFoa1VNQzNB?=
 =?utf-8?B?d0FMV0hIM0dNYUk5amozeWx0elU2cW1aZGdtQThSeGlBUkRicGl1Q0ZzT1dl?=
 =?utf-8?B?UllhNjZlR3hpbG9jVHVsbzAwdXNnODlMSkxTdjFvbiticStka1ZjUnVNUE1o?=
 =?utf-8?B?eTRoTkY5RCtaUkVqTkN0QjBIbzlJdXB2V1ZhMHZJRjJJM3ZPMkJnL3pqNTcx?=
 =?utf-8?B?NVJlVjBTdjIveElrdjR5eFNsdTI1b0NkUnRmenJlTnlGa0dTYzl4Vi9MbTJt?=
 =?utf-8?B?NzkrYStPUnk1N0xkb2lBYzdRTGIzK0pFMXlWSVhmSzVuZ2hqVTBBbmpNQTlO?=
 =?utf-8?B?aXlIZUxZV2hFcXFEeHQ3ZkxkV2srMmVpZ3lOYXIwa0FvL0NpdDFHTkc4WDFp?=
 =?utf-8?B?Rm5la1UvRW1hbWduQTQ5UXRaSW1vZ3RubGVyVnlCQ1Z0TkJpd1BEOFFuelc5?=
 =?utf-8?B?L3pydHlHSEtVRGcxbXlJdHRUK290WmNYMkxiSkQvdjVpTVQ5ekN2OEhvcUtl?=
 =?utf-8?B?RjFUaisrUW00RkN1K3ZUNmJOOXRZaW9wYndyQldGaENuSngveTBOT3RPSzVh?=
 =?utf-8?B?UXlGL2dtRjI1dGZmNzBEMVJtc0g2UlVPdnNjMTMybnNVYXdleXRjSC9GV2g1?=
 =?utf-8?B?TnNxUHRJR203ZlVVaTRnT0RuOTFKdmJhM1F2ajBGamJ6WnVZNVFoMFpwTWRw?=
 =?utf-8?B?SlZZS05iVWdqK0RSdTRCbU1EMUd3T0IzWStYdllhRFFTeXRoY3NLekpBVjJP?=
 =?utf-8?B?RHF4VzJUSW9hcm1iaVFvNlRzOStreDM4cWdER09tZ1E4TC9ORi8zTG1PbzdB?=
 =?utf-8?B?S1V6ZUw2ZUp4Y0xXMU1GSXh4NWdoTjVwaUpld29ORjkzMUNIZlA4c201d2NO?=
 =?utf-8?B?RWVJOUNranNrSThUSklMUzYrLzI3VlA0NVJDTjJrRU5PcUhiZnlyZlFMNzRp?=
 =?utf-8?Q?jpLEh16k/f++xFGTEido9nSyrTZUoaEgTHcqsYbRZV7c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6d042e-ae67-433e-426b-08dab6a0e66a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:52:20.4342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHt56s6vR79sG5IihzrFBP3Xn2D52EuwCBb3efO9uVZwZWPqZ2KkZlipj4CPillE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.10.22 um 15:59 schrieb Michał Winiarski:
> On Tue, Oct 11, 2022 at 01:55:01PM +0200, Christian König wrote:
>> Am 11.10.22 um 13:39 schrieb Simon Ser:
>>> On Tuesday, October 11th, 2022 at 13:04, Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>>>
>>>> --- a/include/drm/drm_file.h
>>>> +++ b/include/drm/drm_file.h
>>>> @@ -54,7 +54,6 @@ struct file;
>>>>     */
>>>>    enum drm_minor_type {
>>>>    	DRM_MINOR_PRIMARY,
>>>> -	DRM_MINOR_CONTROL,
>>>>    	DRM_MINOR_RENDER,
>>>>    };
>>> This makes me uncomfortable: this enum no longer matches DRM_NODE_* in
>>> libdrm.
>> Ah! There it was! I was remembering in the back of my head that we had
>> somehow used this in libdrm as well, but couldn't really get where exactly.
>>
>> But I don't really see a problem here. The control nodes are identified by
>> name and we don't expose them for quite some time now without any negative
>> impact.
>>
>> Even the minor number distribution stays the same. So what bad can come from
>> this?
>>
>> Thanks,
>> Christian.
>>
> I proposed something similar in:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20220817230600.272790-1-michal.winiarski%40intel.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C085831b6e1b647ca1dbd08dab6911b4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638023031607291573%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=56FxZ4UThGlbJ0ut8biicsYtIvtTZ8RGHISJqe%2BXixY%3D&amp;reserved=0
> except acompanied by expanding the minor pool to accomodate more than
> 128 devices:
>
> And after receiving similar feedback, that eventually evolved into
> leaving the "legacy minors" alone, and changing the rules only for cases
> where we have more than 64 devices  (when we run out of the "legacy
> minors").
>
> Perhaps something like this:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20220911211443.581481-1-michal.winiarski%40intel.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C085831b6e1b647ca1dbd08dab6911b4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638023031607291573%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=dFRTx0%2Fi7a4aps57JWGtEJ6GoW5IfI5CQjFkig4KFnA%3D&amp;reserved=0
> Would work for your usecase as well?

We don't desperately need the additional minor numbers, this was merely 
just a cleanup to remove an unused define.

Christian.

>
> -Michał

