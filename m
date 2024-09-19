Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA797CE0D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 21:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B801A10E00D;
	Thu, 19 Sep 2024 19:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="fzvLBANY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D1010E00D;
 Thu, 19 Sep 2024 19:12:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240919191221euoutp010ddd44cc9e7483f2de1362b72161a6e4~2uwYTi6ct2616526165euoutp01c;
 Thu, 19 Sep 2024 19:12:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240919191221euoutp010ddd44cc9e7483f2de1362b72161a6e4~2uwYTi6ct2616526165euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1726773141;
 bh=5wMWZ+g85x3/VQ4fe0nCOsxCOPo6Ph9ygPWjlPbrfW0=;
 h=Date:Subject:To:CC:From:In-Reply-To:References:From;
 b=fzvLBANYeCN29tswLwUd47pXXc6AIHl4SdOotmBcpN7h4RgkQuES0RWvwTyB+1PqY
 l6fR+qZymcrJAUga1SRkwi8ZqVPiz8MlXoCeBIAsBlKEdUKM91n2A8+xvmdQxxaeiC
 HXq/LEs57wGuy/k0nXaH8BWMs//KbjyFOD+WNJ8w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240919191221eucas1p17631c52c12e9eac528029fc313e0de7c~2uwX8PxpR2404624046eucas1p1A;
 Thu, 19 Sep 2024 19:12:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7C.44.09624.5977CE66; Thu, 19
 Sep 2024 20:12:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240919191220eucas1p23f207681d0268c632f46323fd5ac9107~2uwXFO6tm3227632276eucas1p2i;
 Thu, 19 Sep 2024 19:12:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240919191220eusmtrp2b6213760a633a6ab532f5875087dc3ab~2uwXCvxYJ2424224242eusmtrp2m;
 Thu, 19 Sep 2024 19:12:20 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-0c-66ec7795e51c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 13.E4.14621.4977CE66; Thu, 19
 Sep 2024 20:12:20 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240919191220eusmtip26823cf362cdfc852c6290fd3d6148856~2uwWtZnoN2388723887eusmtip2S;
 Thu, 19 Sep 2024 19:12:20 +0000 (GMT)
Received: from [106.110.32.87] (106.110.32.87) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 19 Sep 2024 20:12:17 +0100
Message-ID: <d2726a61-37fa-4c39-aad6-08bf99d8d14b@samsung.com>
Date: Thu, 19 Sep 2024 21:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] drm/xe: xe_gen_wa_oob: fix
 program_invocation_short_name for macos
Content-Language: en-GB
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>,
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Paul Moore <paul@paul-moore.com>, "Stephen
 Smalley" <stephen.smalley.work@gmail.com>, Ondrej Mosnacek
 <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, Justin Stitt <justinstitt@google.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <speakup@linux-speakup.org>,
 <selinux@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvmarm@lists.linux.dev>, <linux-serial@vger.kernel.org>,
 <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, "Daniel Gomez
 (Samsung)" <d+samsung@kruces.com>, <gost.dev@samsung.com>
From: Daniel Gomez <da.gomez@samsung.com>
In-Reply-To: <CAK7LNAQDxVGOa5g3f_dqZ5nD_u8_a++T+ussL+AWuOXs-XOsow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [106.110.32.87]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0yTVxjHPe+1INWXStejEIldumUQmCboziZBt/DhXYKJlw8ys0y68YJM
 bmkpbm5GRO7gxkUodNAhlFtlQysgV3HAWjpAQBCRy2CRu1ynjovMjlLM+PZ/nvP7P8/5n+Tw
 cMFrag8vIDiMkwVLA8WUNVGpX+lwSb8w47d/6qUQtTzOw9B8YRJAeu0kjmpNQzjqeTlPoav5
 ZRRavjOJoeF7RRiay3FAGTfzKaTuMhJouryJQLqnvSRaq6nCUHdNNoXa8q/RaPR6A4XGnhZS
 6MZiBYH+GukjUXW2kUT1Zd0U0nU/J1FMfCGJYkvGKLSQbMLQeH0LidJXZig0m/w7jQZSlQRq
 UPXSqHhZCVCHQU8jU8NeVFnVDtBERxpAWQMDAD2rWh9cPpNCoryYD1DU4EH0pOAWfdSJLVWX
 ArZO306x9f/kEmxN4x2KrVYN0WyuTsFGNc+SbH7dFMbqtPEUq45XY6zp2gjJNpvyaPZGRDrO
 qo0n2IacUpodTjRgx+EZa3dfLjAgnJO97+FjfS6mNpMOnd77TcTN7RFgUpQArHiQcYPKSTVI
 ANY8AVMMYFNsBW0pXgAYvZyHmykB8xzAfzMlbxxZtRGUBSoCcHC2ebNYh14tpW0W1QDqO1oI
 s4XPeEDdgyVg1gQjgbdq50hL3xYas0Y3GCHjCIf7M2mz3sX4wIIE5QaPMyIY+aJkg7djnOBg
 QRxpXoAzUzZwIrVzw0wx78F7Rt2G2Yo5AdVRf65r3jr0EVS2fGqZ4wivVvyEWyLsg5kpJYRF
 X4J/lPdj5pmQqd0OC283kpYDTzg3ZtyEdsFpQzlt0Q7QVP0zZtH+UPOrapMJhXUDKtK8FzKH
 4Q9tgZb2x7BszYBZ2jtg36yt5To7YGqlEk8GEtWWl1BtSaz6P4BqS4BcQGiBiFPIg/w5+YFg
 7oKrXBokVwT7u34VEqQD61+k9bXh7yqQM73o2ggwHmgEkIeL7fiihSk/Ad9X+u1FThZyVqYI
 5OSNwJ5HiEV8ia8jJ2D8pWHceY4L5WRvTjGe1Z4IjBdx+rvVw5rVDLfOZ6aetyQtXp2/ZPu8
 i+mzT43f9r4c03vSTubYcX/V9vShhVFh/nzSqZNj9p454R9OdOFKr6b6ZEnrl5ELS2ekI3e1
 ogRx0aL7F9ijT74XeOAZLp2XNCkhjo8Mv7Xv65OIAxTuV8Z3DmmOK1wOKdWSh86Ul+agzcP4
 aFrS/06c/2fO2kjC/ZV18f36Rd+gNJFwjZdUW9fNVwjHghyWcx7HSJOqekabvS+mGBShsZrG
 bd47n5iOxF05u63ncrhNtN+K9q7n1yFt9keDAj8vSuZnHdv99phDz/Wu+dYmbX54lPD8j4nO
 6snoBjc2/kHskd1FiWGD5ftnmsSE/Jz0gBMuk0v/A5xW+OaRBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0yTVxjGPV+/S0GYHxXCgRHFJixCYqFA8WCAbQmZ3xYzZWK2wQAb+bhf
 TEsFXYzNIHUUMSAqUKFiG1Aum65cLJTLYKzIGJLRwZgIuClyEUEGKjiwA8oS/vud8z7v87zn
 5Bwuh3eXdObGp6SxkhRxEp+0xnvedo3uu5w+E+NlGnBA9/7QYGiu4gJAxqpJDjKYRzjo95dz
 JMrU3ibRUu0khsZab2JottQFXa3Wkkj9WzeOput+wpHu8SCBVpr0GDI1lZDoV20uhZ5cbiPR
 +OMKEt2Yr8fRX4+GCNRY0k2gltsmEulMCwRSZFcQ6HzlOIle5Jkx9LTlHoGuLM+Q6HnezxQa
 vlSIozbVIIVuLRUC1NdlpJC5bRdq0PcCNNFXAFDx8DBAz/RrxnUz+QTSKPajrIci9Gf5HeoD
 D6ZGXQOYZmMvybS8KsOZpo5akmlUjVBMmU7GZHU+Jxht8xTG6KqySUadrcYYc+4jguk0ayjm
 hvwKh1F3hzBtpTUUM5bThR2BYYIASaosjXWNS5WmBfLDhchbIPRHAm9ff4HQZ3/EAW8R3zMo
 IJpNij/FSjyDjgviFIYi6uT0rgx59XY5mHRUAisupH1hsUFOKoE1l0eXA9hfqsEsBRf4w+IA
 YeGdcGVQuSmaB7BCn7O5aASwaDxzo8OWDoK6+6/BOuO0G7xjmCUs+3awu/gJvs4O9G449qCI
 Wued9HFYrizc0HNoR/jNYuWG3p72gA/LvyXWAzj0hA08f0uHWdI0GOzXjm6kkbQ7bO3WbThZ
 0SFQnTVKWZwQ1M60b/JumFl/jWM5wx5YlF+JW/gsXFh9CvKAg2rLgKotg6i2WKm2WJUBvArY
 szJpcmyyVCiQipOlspRYwYnUZB1Ye8ENxuVaPVBPzws6AMYFHQByOXx7W8cXUzE822jx6TOs
 JDVKIktipR1AtHZL+RxnhxOpa18gJS1K6OclEvr6+XuJ/P18+I62H5n6Ynh0rDiNTWTZk6zk
 /z6Ma+Usx04lMZ9mlX14eDl0OXdHztRLyvcXm72dE831nzXyE2Nmffr1wW6ai1czMkcC4NeG
 g4PtxRE20ZENipCDRVYXI123lZTWykP6icaZQNPNdCv3c70GP55LwqF/ek43/AgJuGB0c7Ie
 0r/zSWhynsLp+6++e/8s7RmGuEcH4qvD/9W/MkGdKGT2820KLLp9X/r2yXEZqZrLiFsNi+ap
 90TefYZlX3fvNKY05a944b0fc5WH/r7+4FigwT3qrS48tL4kaNU1ZuTI/OuFa+L77znWti6t
 RPRgb84l2CgTqYL6gpwCWH3mSx/jgPldwZtFeztZwiWe3URZ3Y4+py8OD104EBx8lI9L48RC
 D45EKv4P8XlwBEoEAAA=
X-CMS-MailID: 20240919191220eucas1p23f207681d0268c632f46323fd5ac9107
X-Msg-Generator: CA
X-RootMTR: 20240906144003eucas1p1b8c2be4807e04ced52c4902bfbfb9783
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240906144003eucas1p1b8c2be4807e04ced52c4902bfbfb9783
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-3-06beff418848@samsung.com>
 <CGME20240906144003eucas1p1b8c2be4807e04ced52c4902bfbfb9783@eucas1p1.samsung.com>
 <CAK7LNAQDxVGOa5g3f_dqZ5nD_u8_a++T+ussL+AWuOXs-XOsow@mail.gmail.com>
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

On 9/6/2024 4:39 PM, Masahiro Yamada wrote:
> On Fri, Sep 6, 2024 at 8:01 PM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
>>
>> From: Daniel Gomez <da.gomez@samsung.com>
>>
>> Use getprogname() [1] instead of program_invocation_short_name() [2]
>> for macOS hosts.
>>
>> [1]:
>> https://www.gnu.org/software/gnulib/manual/html_node/
>> program_005finvocation_005fshort_005fname.html
>>
>> [2]:
>> https://developer.apple.com/library/archive/documentation/System/
>> Conceptual/ManPages_iPhoneOS/man3/getprogname.3.html
>>
>> Fixes build error for macOS hosts:
>>
>> drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
>> undeclared identifier 'program_invocation_short_name'    34 |
>> program_invocation_short_name);       |                 ^ 1 error
>> generated.
>>
>> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gen_wa_oob.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> index 904cf47925aa..0d933644d8a0 100644
>> --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> @@ -8,6 +8,7 @@
>>   #include <errno.h>
>>   #include <stdbool.h>
>>   #include <stdio.h>
>> +#include <stdlib.h>
>>   #include <string.h>
>>
>>   #define HEADER \
>> @@ -30,6 +31,9 @@
>>
>>   static void print_usage(FILE *f)
>>   {
>> +#ifdef __APPLE__
>> +       const char *program_invocation_short_name = getprogname();
>> +#endif
>>          fprintf(f, "usage: %s <input-rule-file> <generated-c-source-file> <generated-c-header-file>\n",
>>                  program_invocation_short_name);
>>   }
>>
>> --
>> 2.46.0
>>
>>
> 
> 
> 
> Before adding such #ifdef, you should check how other programs do.
> 
> 
> 
> 
> 
> 
> 
> 
> 
> Solution 1 : hard-code the program name
> 
> 
> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> index 106ee2b027f0..9e9a29e2cecf 100644
> --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> @@ -30,8 +30,7 @@
> 
>   static void print_usage(FILE *f)
>   {
> -       fprintf(f, "usage: %s <input-rule-file>
> <generated-c-source-file> <generated-c-header-file>\n",
> -               program_invocation_short_name);
> +       fprintf(f, "usage: xe_gen_wa_oob <input-rule-file>
> <generated-c-source-file> <generated-c-header-file>\n");
>   }
> 
>   static void print_parse_error(const char *err_msg, const char *line,
> 
> 
> 
> 
> 
> 
> 
> 
> Solution 2: use argv[0]
> 
> 
> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> index 106ee2b027f0..600c63e88e46 100644
> --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> @@ -28,10 +28,10 @@
>          "\n" \
>          "#endif\n"
> 
> -static void print_usage(FILE *f)
> +static void print_usage(FILE *f, const char *progname)
>   {
>          fprintf(f, "usage: %s <input-rule-file>
> <generated-c-source-file> <generated-c-header-file>\n",
> -               program_invocation_short_name);
> +               progname);
>   }
> 
>   static void print_parse_error(const char *err_msg, const char *line,
> @@ -136,7 +136,7 @@ int main(int argc, const char *argv[])
> 
>          if (argc < 3) {
>                  fprintf(stderr, "ERROR: wrong arguments\n");
> -               print_usage(stderr);
> +               print_usage(stderr, argv[0]);
>                  return 1;
>          }


This approach looks good to me. I will drop Lucas' tag in favor to this. 
Please, Lucas let me know if you disagree any of the proposals here or 
if you have any preference. Otherwise, I'll resend this with solution 2.



> 
> 
> 
> 
> 
> 
> 
> 

