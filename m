Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AF76D09D9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE35610E531;
	Thu, 30 Mar 2023 15:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B57D10E531;
 Thu, 30 Mar 2023 15:39:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdqXpa+INCtizJJpN2U2d5zFm9yOXIL3z/mbyiWGBKRes9oKSuA0U3pd8OM/3neWSgnAfdhIjxXhUunmPJA7abGRExEevQ/aHLLYjQJHyD9YovRMZxaK13V2DXX3+f290S+3ZYD1helUvJx314gardLBASJFg3tETKx8axV858B00eQPgkcf3bzhvIm27SUMSr75gtM8MafYcxKchFZf7DaC1AUva2DxjnxKeD9XD3W8uagcjNIiBg/OJBjLRyZXLXDexRw6jk0JwgFN8exIKV4OdyHqikR1rzSzZqU/K6OUpEsFBm5Di1xQ2SHYKcfxVur2vVU05ES9eJR9Kq5eSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrhEFEDd7CfyXVczW+2j1LB9t9aXGZSucV0Ar/6AWVs=;
 b=TAvFhmc9qP54CQRzMYo2JjMP4ywm5lEE5ZfdbxX83D9XAeaOQTE3FKq2ROCSggx4RU/VcMFL1vGUitkrNfpwnE5I+K6S+tM/3n6TL7dDxEwM2r4v4Cs7n6lpJ/3APlXVr6pGoZ0tlPBch+Nf6IQcJWC0Vf4my+dshEGPOV/cR8gxMajqyfObKN1Y6jZxCKWc8tly4WNTxwDxRihWH5cd1NP9dAX8sKPPCBe37yfSjTTUrOG99nsB6L8FCJuNoo+Pysn4RBtBb7OvADfO7OPrWWNe7z506sJ6uoGPDWQHE6Q+MKtDrAoF0/V66BZGms7DRCPA97kJeXB8I9vtrP8xWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrhEFEDd7CfyXVczW+2j1LB9t9aXGZSucV0Ar/6AWVs=;
 b=tlQvUTJqUh4MOrnhByOACIYktVjC9tnNcuokZa0yQXlVcpsMWqDMLdhelxn41oYTPitCClAG260zhTl2/KVSIlT9nEZawo8SgmsoIPt3dwtzJeAma4u3ZS9jZTHVm3wEdCDzInH6sYXub/h0FnjQOdwWZBgSIMWsf4cvxc12jQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS0PR12MB8071.namprd12.prod.outlook.com (2603:10b6:8:df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.22; Thu, 30 Mar 2023 15:39:08 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 15:39:08 +0000
Message-ID: <6dac0c4b-a792-849b-97be-31ad3a527e7b@amd.com>
Date: Thu, 30 Mar 2023 11:39:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amdkfd: remove unused sq_int_priv variable
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 "Kim, Jonathan" <Jonathan.Kim@amd.com>
References: <20230330152040.1838353-1-trix@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230330152040.1838353-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0230.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::34) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS0PR12MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 4afb4611-a003-4be9-01c2-08db3134e681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ypXS+7APuGI8q3x1Kou3jDu4+qg1GaPN6/ILE64b4TQwxSoUgDM/NDb8FjOuxEuEFVmkIzNRrNfKuMiQaFzX0FaA/9Of9Urkiuyg/cql8ENSIej9G8FEM2TcWhpuxVZP2Mb0zAx7+TipgW3Fx5QU/XseG39SiPomxNseH9c9m2DLA+zrgbs/efC6aGQp00rH0eZFElVkUWHDg4r5BDxve5R49Iu2lkWOxrUVcJqzvaZ4AAGYyF8lZMKxsnxiUciYWv+0XvR1IoN1QvoqicjKT0J2jkFIk/fk2V3zAHPYWG/hHg99cuX2x/137b3tofnSYSet6jTPNduIwIEevbAUBVLKPvOLJ/qGz6ONCcwYhl/yIaycQEioTKZSUd6DJJNo9LihNE0pOBXafAqiSg+iUC6NaKskOmQXKODYtd4EXxximv39cKeUxl1XqwJJe2GxOQdt2wGZHYUwbpbJZCMR+WCpwS2T9TheMmGt9CnysNiUgHWpMVJFExmlBd3sAQZWetSKjuucrRPiTD/JPbR9wcmMhAOhHaJMWk4hTxtAwUoWHk9xRSEvH5OXC6yRsSHtgHqUIgYlUUfL8x5jBSFUy3fMuoi8UAyC982eqJB8NmnYmiqqAyqRIZAzi9hM3HO35e7TzUs97PJWCBEcI5gVt9H4ApABOFvMVIMTnTi8lGE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(31686004)(2906002)(44832011)(66476007)(8936002)(8676002)(41300700001)(66556008)(110136005)(36756003)(6636002)(316002)(4326008)(66946007)(6666004)(478600001)(6486002)(31696002)(86362001)(186003)(921005)(6512007)(6506007)(2616005)(26005)(83380400001)(5660300002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjljWE55K1NoRWoyZGpuKzFSY1pMTUorVjc0TDNiY0kxbUxLTjR3dmNPYTlL?=
 =?utf-8?B?MnhtVEhOV3VKak5sWlZlMzVzQndIbFpiazQ3TlRmZW5VN0pNRjR2K2ZHQTZR?=
 =?utf-8?B?L3NESmRRTHhBZml5cExteXBFSFNYS2JTdTNQSC9pd1loRnVnQy80Y2RNaTBa?=
 =?utf-8?B?dGNJdXY1WTZzbDQzTTZQRUxoR0RqSHB1Tlc3VlMxeS9LMDVCQklQTlVjRy9Z?=
 =?utf-8?B?bEVxbnp0azR1MzZDMkFpOEU1QzNBRHh2SUhhSTlPVjBvS3JVTmtqSTdtZHRL?=
 =?utf-8?B?cXY4bS81blVpc05nR2E0YkFmWUI2L0lUR0dsSERPVnFYYVRmYzRkNkR6dDZF?=
 =?utf-8?B?RlhWK2ZkaU9WZ1VaYTlIMTR0b05yb1RWellXT1JkZy84WXlSUHowQlEwb0NG?=
 =?utf-8?B?MjJoZWhQNk0xbjBSQkdKSk81L0x1MW9rb3BSanRmdEY4NndwenlwVU4rNjdC?=
 =?utf-8?B?Uit6cGZLS01BRCtuQXVtZHM0TW9TbkNsTW1oRk1obmpvaUxDNGZDV0MvVENL?=
 =?utf-8?B?ZC9sdEtXd214U01vVlc2UTRNVTZET1J2TWRPTjhWcVVORnQ2ZmdoekY4WnE2?=
 =?utf-8?B?dkJHVDFPSDZWT0dqRUV0U0NzL2pybnE2bElGRlBwRTQ0N2wvVHNNZVFjTlVS?=
 =?utf-8?B?WVpqM3J6TjFKWVdJaEdZWGhjWHlnOTl2K0NwM1BVLzNnZ3RlNGpFVGV1VUVt?=
 =?utf-8?B?Y0dkTU9pOG5ZUWN1T2RqajAxdllpY3FlZkoxclpHOUVpUm5acldyWklKSURa?=
 =?utf-8?B?ejNoeERnOGh5ZVY0a0dhbWJlWWNGcE1UVHE1dXd2dTA4SU5GT1JuYkp5R3Nn?=
 =?utf-8?B?VDBLNy9pR09EN0ZtL2ZHU3hBd0hjd0hwRGZPd0swQkNyYktYSW85RjlCTml5?=
 =?utf-8?B?S3l0SXVJbHE1UGtqTU9QRXBsS0hUK284ZW5jS21ZYXJzcFYwOTJDYUVxeSt2?=
 =?utf-8?B?R1Naam91RitXcHlycXJycE5UOUFockZDQ282S1hzem9YU2NJeXB4WTl2cTNr?=
 =?utf-8?B?L2p0alRUb041KzNkVEEyU2JRWVJqcXlEdzV6eUhNUnpsejRBT2ZkeGFaMzBL?=
 =?utf-8?B?NE9lYjRPamVrZ1dybjNReTZjYnVsZmFqNVlSdkZObURnY293TWRaRktVSWl5?=
 =?utf-8?B?TVQ5bVVDVmtGUTBXY2lBcDAwZTN4NFVpNUNnMmFFRmVVa2FMQXBSRW54R0J1?=
 =?utf-8?B?MkJBRlpyVHAvL3gwc0h4ZkhlL0hYSUhZbUxzbDVDSG1aUTk5UUYwUkNZZmJs?=
 =?utf-8?B?UW5WSHc4VjFvN0hZUmk4aEswWis2d1RRKzNvNnJycXBHdS9RVGJtWnRPZkdt?=
 =?utf-8?B?eTVXalUraWhLMEdBclREWUpRVUIydkdJcm1rNHBGd0ZKa1NCc040WGp0QTJI?=
 =?utf-8?B?aDF3SG53blplcmtvYU01L2RWdVZ5czlPVW9GQ2U2bnVLYkYwMnVpQ3lkanpa?=
 =?utf-8?B?c2hJSTVJUDZvZEd4eWh3cmdIMXg0YjFINnRYaXJPWTF0bHVjTWllYk14Zi94?=
 =?utf-8?B?cTdxd2V0SklLbkpadStRbFVBaEF1dndtRHZsZExOYnl0bDFZWnVWWWljcVJl?=
 =?utf-8?B?TCtjOCtqREVsd0kyeFpiUW4vR3BlVWNGMWtmVHhuZXA3a0syRnNjMDJxaVBF?=
 =?utf-8?B?dHhUWUR1TDZ3aDFaZERCcEpHTTRvSU9XUmxNak1aYVJyaHVpajZtZGpadVln?=
 =?utf-8?B?UVFlbWZMUHZNd0l5WXFlVXY2UVp2K2d6TWlxWittZXQwWTJRK0ZMRnIyWWxB?=
 =?utf-8?B?cWFUTm56V3FXd3dLUUF4WWJNeXVLQm01a2p6U1djSDVjUlV3R1hpL1BhVm9B?=
 =?utf-8?B?NmJSRVhqQlArSmdxaXNnem0vYlpja2FZSTBDTjNyelNwdi9sbUk3bURCMzh2?=
 =?utf-8?B?NnNaOG1jRURlMEpjQmVJd290MlFVUVIrL3cxV3hJVS9OQ05rWmpUV1R4Z0M0?=
 =?utf-8?B?Wng4MFg5d092UWN3WmhheXJ5RjZGNzVJQ0kzdHR5blc1UThsYjFOYXVWQmps?=
 =?utf-8?B?NmtXUEdmY2tkbWhYbWpVL1g0bWhHQThkMHh3dVRXaS9Zb2dSNFNKamw2N1ZJ?=
 =?utf-8?B?d1lHdWFTZkI2MnFPT2IyQ2FZeEhHS09zQ3piVXZZVndQeGdKVTV6TXdUZDdF?=
 =?utf-8?Q?+I1X9sEFfEQOarLcYvDcyPsCp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afb4611-a003-4be9-01c2-08db3134e681
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:39:08.0938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBB51qP1A7Uz/07TI15r+TXWxGJMuBmcF0YQaZ01M0l2OaAbmfOiITfNG2vfc8Vu8kWFuDQNZ0hlhLDyxIGkaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-03-30 um 11:20 schrieb Tom Rix:
> clang with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:282:38: error: variable
>    'sq_int_priv' set but not used [-Werror,-Wunused-but-set-variable]
>          uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
>                                              ^
> This variable is not used so remove it.

Hi Jon,

I think your debugger patches are going to start using this. Can you 
comment?

I'd prefer not to apply this patch now, as Jon's patches are expected to 
land soon, once Alex is done upstreaming GFX 9.4.3 support.

Regards,
   Felix


>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> index 0d53f6067422..bbd646c0dee7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> @@ -279,7 +279,7 @@ static void event_interrupt_wq_v11(struct kfd_dev *dev,
>   {
>   	uint16_t source_id, client_id, ring_id, pasid, vmid;
>   	uint32_t context_id0, context_id1;
> -	uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
> +	uint8_t sq_int_enc, sq_int_errtype;
>   	struct kfd_vm_fault_info info = {0};
>   	struct kfd_hsa_memory_exception_data exception_data;
>   
> @@ -348,13 +348,6 @@ static void event_interrupt_wq_v11(struct kfd_dev *dev,
>   				break;
>   			case SQ_INTERRUPT_WORD_ENCODING_INST:
>   				print_sq_intr_info_inst(context_id0, context_id1);
> -				sq_int_priv = REG_GET_FIELD(context_id0,
> -						SQ_INTERRUPT_WORD_WAVE_CTXID0, PRIV);
> -				/*if (sq_int_priv && (kfd_set_dbg_ev_from_interrupt(dev, pasid,
> -						KFD_CTXID0_DOORBELL_ID(context_id0),
> -						KFD_CTXID0_TRAP_CODE(context_id0),
> -						NULL, 0)))
> -					return;*/
>   				break;
>   			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
>   				print_sq_intr_info_error(context_id0, context_id1);
