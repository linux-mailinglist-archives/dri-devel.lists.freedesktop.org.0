Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC91FA6F3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 05:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319B089C14;
	Tue, 16 Jun 2020 03:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A107489C14
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 03:29:51 +0000 (UTC)
IronPort-SDR: W+8344JPW7fhe/63NvvUDTYM3ddoGpIanjA732et3zWhAsbmZ8rVTrwsYMS+ukAkMxDD64Cn2G
 bnduI0YeZp2w==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2020 20:29:51 -0700
IronPort-SDR: JzJDJ0wQM7s6WKwmZZX/xwWllXQ7brZE64cHCMpObtBSn+1d7ihUQKwHxEHXl9HquLewVoHfp3
 j3QDWvWR4qGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,517,1583222400"; d="scan'208";a="262005779"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
 by orsmga007.jf.intel.com with ESMTP; 15 Jun 2020 20:29:48 -0700
Subject: Re: [LKP] Re: [drm/mgag200] e44e907dd8:
 phoronix-test-suite.glmark2.800x600.score -64.9% regression
From: Rong Chen <rong.a.chen@intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200515083233.32036-6-tzimmermann@suse.de>
 <20200603090929.GG12456@shao2-debian>
 <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
 <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
Message-ID: <cc7068ef-7fc3-93c5-c7da-e114542d650d@intel.com>
Date: Tue, 16 Jun 2020 11:29:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
Content-Type: multipart/mixed; boundary="------------A580F9BCFCA46269DC9CCE75"
Content-Language: en-US
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 lkp@lists.01.org, OTC LSE PnP <otc.lse.pnp@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------A580F9BCFCA46269DC9CCE75
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/16/20 11:10 AM, Rong Chen wrote:
>
>
> On 6/16/20 4:58 AM, Emil Velikov wrote:
>> Hi all,
>>
>> On Thu, 4 Jun 2020 at 08:11, kernel test robot 
>> <rong.a.chen@intel.com> wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a -64.9% regression of 
>>> phoronix-test-suite.glmark2.800x600.score due to commit:
>>>
>> On one hand, I'm really happy to see performance testing happening
>> although this report is missing various crucial pieces of information.
>>
>>> commit: e44e907dd8f937313d35615d799d54162c56d173 ("[PATCH v3 05/15] 
>>> drm/mgag200: Split MISC register update into PLL selection, SYNC and 
>>> I/O")
>>> url: 
>>> https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-mgag200-Convert-to-atomic-modesetting/20200515-163744
>>> base: git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>>
>>> in testcase: phoronix-test-suite
>>> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz 
>>> with 48G memory
>>> with following parameters:
>>>
>>>          need_x: true
>> Replace "need_x" with the Xorg version as seen in `Xorg -version'.
>
> # Xorg -version
> /bin/sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
>
> X.Org X Server 1.20.4
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 4.9.0-8-amd64 x86_64 Debian
> Current Operating System: Linux lkp-nhm-2ep1 
> 5.7.0-rc5-01428-ge44e907dd8f937 #1 SMP Tue Jun 2 19:51:38 CST 2020 x86_64
> Kernel command line:  ip=::::lkp-nhm-2ep1::dhcp 
> root=/dev/disk/by-id/wwn-0x55cd2e4123123127-part2 
> rootflags=subvol=debian-x86_64-phoronix 
> remote_rootfs=internal-lkp-server:/osimage/debian/debian-x86_64-phoronix 
> user=lkp 
> job=/lkp/jobs/scheduled/lkp-nhm-2ep1/phoronix-test-suite-performance-true-glmark2-1.1.0-ucode=0x1d-debian-x86_64-phoronix-e44e907dd8f937313d35615d799d54162c56d173-20200616-56456-1kgmjzm-0.yaml 
> ARCH=x86_64 kconfig=x86_64-rhel-7.6 
> branch=linux-devel/devel-hourly-2020051600 
> commit=e44e907dd8f937313d35615d799d54162c56d173 
> BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6/gcc-7/e44e907dd8f937313d35615d799d54162c56d173/vmlinuz-5.7.0-rc5-01428-ge44e907dd8f937 
> console=ttyS1,115200 console=tty0 max_uptime=3600 
> RESULT_ROOT=/result/phoronix-test-suite/performance-true-glmark2-1.1.0-ucode=0x1d/lkp-nhm-2ep1/debian-x86_64-phoronix/x86_64-rhel-7.6/gcc-7/e44e907dd8f937313d35615d799d54162c56d173/4 
> LKP_SERVER=inn nokaslr selinux=0 debug apic=debug sysrq_always_enabled 
> rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on 
> panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic 
> load_ramdisk=2 prompt_ramdisk=0 drbd.minor_count=8 
> systemd.log_level=err ignore_loglevel console=tty0 
> earlyprintk=ttyS0,115200 console=ttyS0,115200 vga=normal rw
> Build Date: 05 March 2019  08:11:12PM
> xorg-server 2:1.20.4-1 (https://www.debian.org/support)
> Current version of pixman: 0.36.0
>         Before reporting problems, check http://wiki.x.org
>         to make sure that you have the latest version.
>
>>
>>>          test: glmark2-1.1.0
>>>          cpufreq_governor: performance
>>>          ucode: 0x1d
>>>
>>> test-description: The Phoronix Test Suite is the most comprehensive 
>>> testing and benchmarking platform available that provides an 
>>> extensible framework for which new tests can be easily added.
>>> test-url: http://www.phoronix-test-suite.com/
>>>
>> Please remove the test description and url. They don't add any value.
>>
>> Mention which Mesa version is used as well as on what GPU. The output
>> of lspci and glxinfo will help here.
>
> Attached please find the outputs of lspci and glxinfo

Sorry, the previous lspci is not correct, please find it in this attachment.

Best Regards,
Rong Chen

>
>>
>> For this particular test - there is no Mesa/upstream driver for this
>> GPU, so I imagine one of the swrast drivers was used. Which one -
>> swrast (classic, softpipe, llvmpipe, swr) or kms_swrast.
>> The output of `LD_DEBUG=libs glxinfo  |& grep _dri.so` will help here.
>
> # LD_DEBUG=libs glxinfo  |& grep _dri.so
>       2132:     calling init: /usr/lib/i386-linux-gnu/dri/swrast_dri.so
>       2132:     calling fini: 
> /usr/lib/i386-linux-gnu/dri/swrast_dri.so [0]
>
> Best Regards,
> Rong Chen
>
>>
>>> commit:
>>>    bef2303526 ("drm/mgag200: Move mode-setting code into separate 
>>> helper function")
>>>    e44e907dd8 ("drm/mgag200: Split MISC register update into PLL 
>>> selection, SYNC and I/O")
>>>
>> Actually the offending commit has a subtle change of behaviour - it
>> adds an extra MGAREG_MISC_RAMMAPEN.
>> That is not documented and I've failed to spot it during review.
>>
>> Thomas - shall we revert that line in itself or at least add an inline
>> comment why it is needed?
>>
>>>    100 
>>> +---------------------------------------------------------------------+
>>>     90 |-+    +      +   +.+      +    +     +    +      + 
>>> :               |
>>>        | :    :      :   : :      :    :     :    :      : 
>>> :               |
>>>     80 |-:    :      :   : :      :    :     :    :      : 
>>> :               |
>>>     70 |-::   :     ::   :  :     :   ::     ::   :     :: 
>>> :                |
>>>        |: :  : :    : : :   :    : :  : :   : :  : :    : : 
>>> :                |
>>>     60 |:+:  : :    : : :   :    : :  : :   : :  : :    : : 
>>> :                |
>>>     50 |:+:  : :    : : :   :    : :  : :   : :  : :    : : 
>>> :                |
>>>     40 |:+ : : :   :  : :    :   : : :  :   :  : : :   :  : 
>>> :                |
>>>        |:  : : :   :  : :    :   : : :  :   :  : : :   :  : :O      
>>> O O O  O |
>>>     30 |:+ : : :   :  : :    :   : : :  :   :  : : :   :  : 
>>> :                |
>>>     20 |-+ ::   :  :   :     :  :   ::   : :   ::   :  : O 
>>> :                 |
>>>        |    :   : :    :      : :   :    : :    :   : : 
>>> :                 |
>>>     10 |-+  :   : :    :      : :   :    : :    :   : : 
>>> :                 |
>>>      0 
>>> +---------------------------------------------------------------------+
>>>
>>>
>>>                     phoronix-test-suite.glmark2.1024x768.score
>>>
>>>    70 
>>> +----------------------------------------------------------------------+ 
>>>
>>>       | +    +      +   +..+     +    +      +    +     + 
>>> +.+             |
>>>    60 |-:    :      :   :  :     :    :      :    :     : 
>>> :               |
>>>       | :    :      :   :  :     :    :      :    :     : 
>>> :               |
>>>    50 |-::   :     ::   :  :     ::   :      :   ::     :: 
>>> :               |
>>>       |: :  : :    : : :    :   : :  : :    : :  : :   : : 
>>> :                |
>>>    40 |:+:  : :    : : :    :   : :  : :    : :  : :   : : 
>>> :                |
>>>       |: :  : :    : : :    :   : :  : :    : :  : :   : : :         
>>> O      |
>>>    30 |:+ : : :   :  : :    :   :  : : :    : : :  :   :  : :O      
>>> O   O  O |
>>>       |:  : : :   :  : :    :   :  : : :    : : :  :   :  : 
>>> :                |
>>>    20 |:+ : : :   :  : :    :   :  : : :    : : :  :   :  : 
>>> :                |
>>>       |   ::   :  :   :      : :   ::   :  :   ::   : : O 
>>> ::                 |
>>>    10 |-+  :   : :    :      : :    :   :  :   :    : : 
>>> :                 |
>>>       |    :   : :  O :    O : : O  :   :  : O :    : : 
>>> :                 |
>>>     0 
>>> +----------------------------------------------------------------------+ 
>>>
>>>
>>>
>>> [*] bisect-good sample
>>> [O] bisect-bad  sample
>>>
>> Hmm I must be going blind - there isn't even a single * in either of 
>> the graphs.
>> Or perhaps my eyesight is fine and the legend or the graphs need fixing.
>>
>> HTH
>> -Emil
>
>
> _______________________________________________
> LKP mailing list -- lkp@lists.01.org
> To unsubscribe send an email to lkp-leave@lists.01.org


--------------A580F9BCFCA46269DC9CCE75
Content-Type: text/plain; charset=UTF-8;
 name="lspci"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="lspci"

MDA6MDAuMCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gNTUyMCBJL08gSHViIHRv
IEVTSSBQb3J0IChyZXYgMTMpCjAwOjAxLjAgUENJIGJyaWRnZTogSW50ZWwgQ29ycG9yYXRp
b24gNTUyMC81NTAwL1g1OCBJL08gSHViIFBDSSBFeHByZXNzIFJvb3QgUG9ydCAxIChyZXYg
MTMpCjAwOjA5LjAgUENJIGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gNzUwMC81NTIwLzU1
MDAvWDU4IEkvTyBIdWIgUENJIEV4cHJlc3MgUm9vdCBQb3J0IDkgKHJldiAxMykKMDA6MGEu
MCBQQ0kgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiA3NTAwLzU1MjAvNTUwMC9YNTggSS9P
IEh1YiBQQ0kgRXhwcmVzcyBSb290IFBvcnQgMTAgKHJldiAxMykKMDA6MTAuMCBQSUM6IElu
dGVsIENvcnBvcmF0aW9uIDc1MDAvNTUyMC81NTAwL1g1OCBQaHlzaWNhbCBhbmQgTGluayBM
YXllciBSZWdpc3RlcnMgUG9ydCAwIChyZXYgMTMpCjAwOjEwLjEgUElDOiBJbnRlbCBDb3Jw
b3JhdGlvbiA3NTAwLzU1MjAvNTUwMC9YNTggUm91dGluZyBhbmQgUHJvdG9jb2wgTGF5ZXIg
UmVnaXN0ZXJzIFBvcnQgMCAocmV2IDEzKQowMDoxMS4wIFBJQzogSW50ZWwgQ29ycG9yYXRp
b24gNzUwMC81NTIwLzU1MDAgUGh5c2ljYWwgYW5kIExpbmsgTGF5ZXIgUmVnaXN0ZXJzIFBv
cnQgMSAocmV2IDEzKQowMDoxMS4xIFBJQzogSW50ZWwgQ29ycG9yYXRpb24gNzUwMC81NTIw
LzU1MDAgUm91dGluZyAmIFByb3RvY29sIExheWVyIFJlZ2lzdGVyIFBvcnQgMSAocmV2IDEz
KQowMDoxMy4wIFBJQzogSW50ZWwgQ29ycG9yYXRpb24gNzUwMC81NTIwLzU1MDAvWDU4IEkv
TyBIdWIgSS9PeEFQSUMgSW50ZXJydXB0IENvbnRyb2xsZXIgKHJldiAxMykKMDA6MTQuMCBQ
SUM6IEludGVsIENvcnBvcmF0aW9uIDc1MDAvNTUyMC81NTAwL1g1OCBJL08gSHViIFN5c3Rl
bSBNYW5hZ2VtZW50IFJlZ2lzdGVycyAocmV2IDEzKQowMDoxNC4xIFBJQzogSW50ZWwgQ29y
cG9yYXRpb24gNzUwMC81NTIwLzU1MDAvWDU4IEkvTyBIdWIgR1BJTyBhbmQgU2NyYXRjaCBQ
YWQgUmVnaXN0ZXJzIChyZXYgMTMpCjAwOjE0LjIgUElDOiBJbnRlbCBDb3Jwb3JhdGlvbiA3
NTAwLzU1MjAvNTUwMC9YNTggSS9PIEh1YiBDb250cm9sIFN0YXR1cyBhbmQgUkFTIFJlZ2lz
dGVycyAocmV2IDEzKQowMDoxNC4zIFBJQzogSW50ZWwgQ29ycG9yYXRpb24gNzUwMC81NTIw
LzU1MDAvWDU4IEkvTyBIdWIgVGhyb3R0bGUgUmVnaXN0ZXJzIChyZXYgMTMpCjAwOjE1LjAg
UElDOiBJbnRlbCBDb3Jwb3JhdGlvbiA3NTAwLzU1MjAvNTUwMC9YNTggVHJ1c3RlZCBFeGVj
dXRpb24gVGVjaG5vbG9neSBSZWdpc3RlcnMgKHJldiAxMykKMDA6MTYuMCBTeXN0ZW0gcGVy
aXBoZXJhbDogSW50ZWwgQ29ycG9yYXRpb24gNTUyMC81NTAwL1g1OCBDaGlwc2V0IFF1aWNr
RGF0YSBUZWNobm9sb2d5IERldmljZSAocmV2IDEzKQowMDoxNi4xIFN5c3RlbSBwZXJpcGhl
cmFsOiBJbnRlbCBDb3Jwb3JhdGlvbiA1NTIwLzU1MDAvWDU4IENoaXBzZXQgUXVpY2tEYXRh
IFRlY2hub2xvZ3kgRGV2aWNlIChyZXYgMTMpCjAwOjE2LjIgU3lzdGVtIHBlcmlwaGVyYWw6
IEludGVsIENvcnBvcmF0aW9uIDU1MjAvNTUwMC9YNTggQ2hpcHNldCBRdWlja0RhdGEgVGVj
aG5vbG9neSBEZXZpY2UgKHJldiAxMykKMDA6MTYuMyBTeXN0ZW0gcGVyaXBoZXJhbDogSW50
ZWwgQ29ycG9yYXRpb24gNTUyMC81NTAwL1g1OCBDaGlwc2V0IFF1aWNrRGF0YSBUZWNobm9s
b2d5IERldmljZSAocmV2IDEzKQowMDoxNi40IFN5c3RlbSBwZXJpcGhlcmFsOiBJbnRlbCBD
b3Jwb3JhdGlvbiA1NTIwLzU1MDAvWDU4IENoaXBzZXQgUXVpY2tEYXRhIFRlY2hub2xvZ3kg
RGV2aWNlIChyZXYgMTMpCjAwOjE2LjUgU3lzdGVtIHBlcmlwaGVyYWw6IEludGVsIENvcnBv
cmF0aW9uIDU1MjAvNTUwMC9YNTggQ2hpcHNldCBRdWlja0RhdGEgVGVjaG5vbG9neSBEZXZp
Y2UgKHJldiAxMykKMDA6MTYuNiBTeXN0ZW0gcGVyaXBoZXJhbDogSW50ZWwgQ29ycG9yYXRp
b24gNTUyMC81NTAwL1g1OCBDaGlwc2V0IFF1aWNrRGF0YSBUZWNobm9sb2d5IERldmljZSAo
cmV2IDEzKQowMDoxNi43IFN5c3RlbSBwZXJpcGhlcmFsOiBJbnRlbCBDb3Jwb3JhdGlvbiA1
NTIwLzU1MDAvWDU4IENoaXBzZXQgUXVpY2tEYXRhIFRlY2hub2xvZ3kgRGV2aWNlIChyZXYg
MTMpCjAwOjFhLjAgVVNCIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkg
KElDSDEwIEZhbWlseSkgVVNCIFVIQ0kgQ29udHJvbGxlciAjNAowMDoxYS4xIFVTQiBjb250
cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUpJIChJQ0gxMCBGYW1pbHkpIFVTQiBV
SENJIENvbnRyb2xsZXIgIzUKMDA6MWEuMiBVU0IgY29udHJvbGxlcjogSW50ZWwgQ29ycG9y
YXRpb24gODI4MDFKSSAoSUNIMTAgRmFtaWx5KSBVU0IgVUhDSSBDb250cm9sbGVyICM2CjAw
OjFhLjcgVVNCIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkgKElDSDEw
IEZhbWlseSkgVVNCMiBFSENJIENvbnRyb2xsZXIgIzIKMDA6MWMuMCBQQ0kgYnJpZGdlOiBJ
bnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUpJIChJQ0gxMCBGYW1pbHkpIFBDSSBFeHByZXNzIFJv
b3QgUG9ydCAxCjAwOjFjLjQgUENJIGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gODI4MDFK
SSAoSUNIMTAgRmFtaWx5KSBQQ0kgRXhwcmVzcyBSb290IFBvcnQgNQowMDoxYy41IFBDSSBi
cmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkgKElDSDEwIEZhbWlseSkgUENJIEV4
cHJlc3MgUm9vdCBQb3J0IDYKMDA6MWQuMCBVU0IgY29udHJvbGxlcjogSW50ZWwgQ29ycG9y
YXRpb24gODI4MDFKSSAoSUNIMTAgRmFtaWx5KSBVU0IgVUhDSSBDb250cm9sbGVyICMxCjAw
OjFkLjEgVVNCIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkgKElDSDEw
IEZhbWlseSkgVVNCIFVIQ0kgQ29udHJvbGxlciAjMgowMDoxZC4yIFVTQiBjb250cm9sbGVy
OiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUpJIChJQ0gxMCBGYW1pbHkpIFVTQiBVSENJIENv
bnRyb2xsZXIgIzMKMDA6MWQuNyBVU0IgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24g
ODI4MDFKSSAoSUNIMTAgRmFtaWx5KSBVU0IyIEVIQ0kgQ29udHJvbGxlciAjMQowMDoxZS4w
IFBDSSBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxIFBDSSBCcmlkZ2UgKHJldiA5
MCkKMDA6MWYuMCBJU0EgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUpJUiAoSUNI
MTBSKSBMUEMgSW50ZXJmYWNlIENvbnRyb2xsZXIKMDA6MWYuMiBJREUgaW50ZXJmYWNlOiBJ
bnRlbCBDb3Jwb3JhdGlvbiA4MjgwMUpJIChJQ0gxMCBGYW1pbHkpIDQgcG9ydCBTQVRBIElE
RSBDb250cm9sbGVyICMxCjAwOjFmLjMgU01CdXM6IEludGVsIENvcnBvcmF0aW9uIDgyODAx
SkkgKElDSDEwIEZhbWlseSkgU01CdXMgQ29udHJvbGxlcgowMDoxZi41IElERSBpbnRlcmZh
Y2U6IEludGVsIENvcnBvcmF0aW9uIDgyODAxSkkgKElDSDEwIEZhbWlseSkgMiBwb3J0IFNB
VEEgSURFIENvbnRyb2xsZXIgIzIKMDE6MDAuMCBFdGhlcm5ldCBjb250cm9sbGVyOiBJbnRl
bCBDb3Jwb3JhdGlvbiA4MjU3NUVCIEdpZ2FiaXQgTmV0d29yayBDb25uZWN0aW9uIChyZXYg
MDIpCjAxOjAwLjEgRXRoZXJuZXQgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gODI1
NzVFQiBHaWdhYml0IE5ldHdvcmsgQ29ubmVjdGlvbiAocmV2IDAyKQowNDowMC4wIFNDU0kg
c3RvcmFnZSBjb250cm9sbGVyOiBMU0kgTG9naWMgLyBTeW1iaW9zIExvZ2ljIFNBUzEwNzgg
UENJLUV4cHJlc3MgRnVzaW9uLU1QVCBTQVMgKHJldiAwNCkKMDU6MDAuMCBWR0EgY29tcGF0
aWJsZSBjb250cm9sbGVyOiBNYXRyb3ggRWxlY3Ryb25pY3MgU3lzdGVtcyBMdGQuIE1HQSBH
MjAwZSBbUGlsb3RdIFNlcnZlckVuZ2luZXMgKFNFUDEpIChyZXYgMDIpCmZlOjAwLjAgSG9z
dCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IFF1aWNrUGF0
aCBBcmNoaXRlY3R1cmUgR2VuZXJpYyBOb24tQ29yZSBSZWdpc3RlcnMgKHJldiAwNSkKZmU6
MDAuMSBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcg
UXVpY2tQYXRoIEFyY2hpdGVjdHVyZSBTeXN0ZW0gQWRkcmVzcyBEZWNvZGVyIChyZXYgMDUp
CmZlOjAyLjAgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3Jl
IGk3IFFQSSBMaW5rIDAgKHJldiAwNSkKZmU6MDIuMSBIb3N0IGJyaWRnZTogSW50ZWwgQ29y
cG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgUVBJIFBoeXNpY2FsIDAgKHJldiAwNSkKZmU6
MDIuNCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcg
UVBJIExpbmsgMSAocmV2IDA1KQpmZTowMi41IEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3Jh
dGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBRUEkgUGh5c2ljYWwgMSAocmV2IDA1KQpmZTowMy4w
IEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRl
Z3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIChyZXYgMDUpCmZlOjAzLjEgSG9zdCBicmlkZ2U6
IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5
IENvbnRyb2xsZXIgVGFyZ2V0IEFkZHJlc3MgRGVjb2RlciAocmV2IDA1KQpmZTowMy4yIEhv
c3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3Jh
dGVkIE1lbW9yeSBDb250cm9sbGVyIFJBUyBSZWdpc3RlcnMgKHJldiAwNSkKZmU6MDMuNCBI
b3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdy
YXRlZCBNZW1vcnkgQ29udHJvbGxlciBUZXN0IFJlZ2lzdGVycyAocmV2IDA1KQpmZTowNC4w
IEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRl
Z3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5uZWwgMCBDb250cm9sIFJlZ2lzdGVycyAo
cmV2IDA1KQpmZTowNC4xIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1
MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5uZWwgMCBBZGRy
ZXNzIFJlZ2lzdGVycyAocmV2IDA1KQpmZTowNC4yIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jw
b3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVy
IENoYW5uZWwgMCBSYW5rIFJlZ2lzdGVycyAocmV2IDA1KQpmZTowNC4zIEhvc3QgYnJpZGdl
OiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9y
eSBDb250cm9sbGVyIENoYW5uZWwgMCBUaGVybWFsIENvbnRyb2wgUmVnaXN0ZXJzIChyZXYg
MDUpCmZlOjA1LjAgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9D
b3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAxIENvbnRyb2wg
UmVnaXN0ZXJzIChyZXYgMDUpCmZlOjA1LjEgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0
aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hh
bm5lbCAxIEFkZHJlc3MgUmVnaXN0ZXJzIChyZXYgMDUpCmZlOjA1LjIgSG9zdCBicmlkZ2U6
IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5
IENvbnRyb2xsZXIgQ2hhbm5lbCAxIFJhbmsgUmVnaXN0ZXJzIChyZXYgMDUpCmZlOjA1LjMg
SG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVn
cmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAxIFRoZXJtYWwgQ29udHJvbCBSZWdp
c3RlcnMgKHJldiAwNSkKZmU6MDYuMCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24g
WGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxlciBDaGFubmVs
IDIgQ29udHJvbCBSZWdpc3RlcnMgKHJldiAwNSkKZmU6MDYuMSBIb3N0IGJyaWRnZTogSW50
ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29u
dHJvbGxlciBDaGFubmVsIDIgQWRkcmVzcyBSZWdpc3RlcnMgKHJldiAwNSkKZmU6MDYuMiBI
b3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdy
YXRlZCBNZW1vcnkgQ29udHJvbGxlciBDaGFubmVsIDIgUmFuayBSZWdpc3RlcnMgKHJldiAw
NSkKZmU6MDYuMyBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0Nv
cmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxlciBDaGFubmVsIDIgVGhlcm1hbCBD
b250cm9sIFJlZ2lzdGVycyAocmV2IDA1KQpmZjowMC4wIEhvc3QgYnJpZGdlOiBJbnRlbCBD
b3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBRdWlja1BhdGggQXJjaGl0ZWN0dXJlIEdl
bmVyaWMgTm9uLUNvcmUgUmVnaXN0ZXJzIChyZXYgMDUpCmZmOjAwLjEgSG9zdCBicmlkZ2U6
IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IFF1aWNrUGF0aCBBcmNoaXRl
Y3R1cmUgU3lzdGVtIEFkZHJlc3MgRGVjb2RlciAocmV2IDA1KQpmZjowMi4wIEhvc3QgYnJp
ZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBRUEkgTGluayAwIChy
ZXYgMDUpCmZmOjAyLjEgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUw
MC9Db3JlIGk3IFFQSSBQaHlzaWNhbCAwIChyZXYgMDUpCmZmOjAyLjQgSG9zdCBicmlkZ2U6
IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IFFQSSBMaW5rIDEgKHJldiAw
NSkKZmY6MDIuNSBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0Nv
cmUgaTcgUVBJIFBoeXNpY2FsIDEgKHJldiAwNSkKZmY6MDMuMCBIb3N0IGJyaWRnZTogSW50
ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29u
dHJvbGxlciAocmV2IDA1KQpmZjowMy4xIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlv
biBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIFRhcmdl
dCBBZGRyZXNzIERlY29kZXIgKHJldiAwNSkKZmY6MDMuMiBIb3N0IGJyaWRnZTogSW50ZWwg
Q29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJv
bGxlciBSQVMgUmVnaXN0ZXJzIChyZXYgMDUpCmZmOjAzLjQgSG9zdCBicmlkZ2U6IEludGVs
IENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRy
b2xsZXIgVGVzdCBSZWdpc3RlcnMgKHJldiAwNSkKZmY6MDQuMCBIb3N0IGJyaWRnZTogSW50
ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29u
dHJvbGxlciBDaGFubmVsIDAgQ29udHJvbCBSZWdpc3RlcnMgKHJldiAwNSkKZmY6MDQuMSBI
b3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdy
YXRlZCBNZW1vcnkgQ29udHJvbGxlciBDaGFubmVsIDAgQWRkcmVzcyBSZWdpc3RlcnMgKHJl
diAwNSkKZmY6MDQuMiBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiA1NTAw
L0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxlciBDaGFubmVsIDAgUmFuayBS
ZWdpc3RlcnMgKHJldiAwNSkKZmY6MDQuMyBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRp
b24gWGVvbiA1NTAwL0NvcmUgaTcgSW50ZWdyYXRlZCBNZW1vcnkgQ29udHJvbGxlciBDaGFu
bmVsIDAgVGhlcm1hbCBDb250cm9sIFJlZ2lzdGVycyAocmV2IDA1KQpmZjowNS4wIEhvc3Qg
YnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVk
IE1lbW9yeSBDb250cm9sbGVyIENoYW5uZWwgMSBDb250cm9sIFJlZ2lzdGVycyAocmV2IDA1
KQpmZjowNS4xIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29y
ZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5uZWwgMSBBZGRyZXNzIFJl
Z2lzdGVycyAocmV2IDA1KQpmZjowNS4yIEhvc3QgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlv
biBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250cm9sbGVyIENoYW5u
ZWwgMSBSYW5rIFJlZ2lzdGVycyAocmV2IDA1KQpmZjowNS4zIEhvc3QgYnJpZGdlOiBJbnRl
bCBDb3Jwb3JhdGlvbiBYZW9uIDU1MDAvQ29yZSBpNyBJbnRlZ3JhdGVkIE1lbW9yeSBDb250
cm9sbGVyIENoYW5uZWwgMSBUaGVybWFsIENvbnRyb2wgUmVnaXN0ZXJzIChyZXYgMDUpCmZm
OjA2LjAgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3
IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAyIENvbnRyb2wgUmVnaXN0
ZXJzIChyZXYgMDUpCmZmOjA2LjEgSG9zdCBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhl
b24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAy
IEFkZHJlc3MgUmVnaXN0ZXJzIChyZXYgMDUpCmZmOjA2LjIgSG9zdCBicmlkZ2U6IEludGVs
IENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQgTWVtb3J5IENvbnRy
b2xsZXIgQ2hhbm5lbCAyIFJhbmsgUmVnaXN0ZXJzIChyZXYgMDUpCmZmOjA2LjMgSG9zdCBi
cmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFhlb24gNTUwMC9Db3JlIGk3IEludGVncmF0ZWQg
TWVtb3J5IENvbnRyb2xsZXIgQ2hhbm5lbCAyIFRoZXJtYWwgQ29udHJvbCBSZWdpc3RlcnMg
KHJldiAwNSkK
--------------A580F9BCFCA46269DC9CCE75
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------A580F9BCFCA46269DC9CCE75--
