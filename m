Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202773F06DA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F806E7FE;
	Wed, 18 Aug 2021 14:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0C6E7E6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:38:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="195914937"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
 d="gz'50?scan'50,208,50";a="195914937"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 07:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
 d="gz'50?scan'50,208,50";a="449744985"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 18 Aug 2021 07:38:02 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mGMhd-000T1F-Uj; Wed, 18 Aug 2021 14:38:01 +0000
Date: Wed, 18 Aug 2021 22:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kbuild-all@lists.01.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 4/5] drm: zte: remove obsolete DRM Support for ZTE SoCs
Message-ID: <202108182226.Exq8OhFZ-lkp@intel.com>
References: <20210818124114.28545-5-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20210818124114.28545-5-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lukas,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20210818]
[cannot apply to rockchip/for-next linus/master v5.14-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lukas-Bulwahn/Kconfig-symbol-clean-up-on-gpu/20210818-204414
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-tinyconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/432489a34862a1874790d81866c3a30bca355979
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lukas-Bulwahn/Kconfig-symbol-clean-up-on-gpu/20210818-204414
        git checkout 432489a34862a1874790d81866c3a30bca355979
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/Kconfig:354: can't open file "drivers/gpu/drm/zte/Kconfig"
--
>> drivers/gpu/drm/Kconfig:354: can't open file "drivers/gpu/drm/zte/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[1]: *** [Makefile:626: olddefconfig] Error 2
   make: *** [Makefile:220: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.
--
>> drivers/gpu/drm/Kconfig:354: can't open file "drivers/gpu/drm/zte/Kconfig"
   make[3]: *** [scripts/kconfig/Makefile:77: syncconfig] Error 1
   make[2]: *** [Makefile:626: syncconfig] Error 2
   make[1]: *** [Makefile:736: include/config/auto.conf.cmd] Error 2
   make[1]: Failed to remake makefile 'include/config/auto.conf.cmd'.
   make[1]: Failed to remake makefile 'include/config/auto.conf'.
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:220: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +354 drivers/gpu/drm/Kconfig

d92d9c3a14488e David Herrmann 2016-08-04  353  
0a886f59528aac Shawn Guo      2016-09-22 @354  source "drivers/gpu/drm/zte/Kconfig"
0a886f59528aac Shawn Guo      2016-09-22  355  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--VbJkn9YxBvnuCH5J
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICCMWHWEAAy5jb25maWcAlDzbctu4ku/zFayZqq3kIYljOz7ObvkBAkEJI95CkLLkF5ZG
phPV2JJXl5nk77cbIEWQbCjZU+ec2OhG49b3bvqP3/7w2PGwfVke1qvl8/MP72u1qXbLQ/Xo
Pa2fq//x/MSLk9wTvszfA3K43hy/f1hf3d54n95fv/94felNq92mevb4dvO0/nqEuevt5rc/
foP//gGDL69AZvff3tfV6t1n741f/bVebrzP76/eX7y7vHxrfgJcnsSBHJecl1KVY87vfjRD
8Es5E5mSSXz3+eLq4uKEG7J4fAJdWCQ4i8tQxtOWCAxOmCqZispxkickQMYwR7QgmX0p75PM
ojIqZOjnMhKlmOdsFIpSJVnewvNJJpgPhIIE/q/MmcLJ+ibG+l6fvX11OL625x1lyVTEZRKX
KkqtpWOZlyKelSwbw0kimd9dXeJ91ptOolTC6rlQubfee5vtAQk3s8OEs7C5l99/b+fZgJIV
eUJM1mcsFQtznFoPTthMlFORxSIsxw/S2qkNGQHkkgaFDxGjIfMH14zEBbgGwOlM1q7s0/Th
em/nEHCHxHXYuxxOSc5TvCYI+iJgRZiXk0TlMYvE3e9vNttN9dZ6JrVQM5lykjbPEqXKSERJ
tihZnjM+IfEKJUI5ItbXV8kyPgEGAKGGtYAnwoZNgee9/fGv/Y/9oXpp2XQsYpFJrkUizZKR
JSU2SE2SexqSCSWyGcuR8aLE70lZkGRc+LX4yHjcQlXKMiUQSd9/tXn0tk+9Xbb6IOFTlRRA
q7xnOZ/4iUVJH9lG8VnOzoBRBC01YUFmLJQwWZQhU3nJFzwkrkNriVl7uz2wpidmIs7VWWAZ
gR5h/p+Fygm8KFFlkeJemvfL1y/Vbk894eShTGFW4ktus3KcIET6oSDZSINJyESOJ/is+qSZ
6uLU7zTYTbOZNBMiSnMgrxXuiWgzPkvCIs5ZtiCXrrFsmLE2afEhX+7/9g6wrreEPewPy8Pe
W65W2+PmsN58ba8jl3xawoSScZ7AWobrTksgV+onbMH0VpQkT/4LW9FbznjhqeFjwXqLEmD2
luBXMDvwhpTKVwbZnq6a+fWWuktZR52aH1y6oohVbev4BIRUM2fDbmr1rXo8goH3nqrl4bir
9nq4XpGAdsTtnsV5OUJJBbpFHLG0zMNRGYSFmtgn5+MsKVJF68OJ4NM0kUAJmDFPMpqPzd7R
5GlaJE4mQkYz3Cicgt6eaZ2Q+cRFgReRpMAv8kGgMkNJg38iFvMOe/fRFPzgvHbpf7yxFCFo
kjwEBuAi1Vo0zxgXPQuZcpVOYfWQ5bh8CzV8Y28lAhskwUhk9HWNRR6B91LWCoxGWqhAncUI
Jix2aZY0UXJOKo+TlMOjTun3KBzS2D0/PZeBPQkK146LXMxJiEgT1z3IcczCwCeB+oAOmFbx
DpiagI0nIUzSXodMyiJz6SnmzyScu34s+sJhwRHLMungiSlOXET03FEanOUE5DTt9wSU+Ght
gG54uwWgFoOFA3nu6EAlvhDzYZbwfeH3xQHWLE9G1uKSjxcdz0zrrDqMSavd03b3stysKk/8
U21AZzPQZhy1NtiyVkU7iPsCmNMA4czlLIIbSXquXK0ef3HFlvYsMguW2iS55AaDAwZ6NaNl
R4Vs5AAUlL+owmRkHxDnwztlY9G4sg7+LYIAjEbKAFHfAQPl7BD0JJDhgHPrW+oGTs2u5rc3
5ZUVa8DvdvSk8qzgWk36goO7mbXApMjTIi+1eoYQp3p+urp8hwHt7x1uhLOZX+9+X+5W3z58
v735sNIh7l6Hv+Vj9WR+P81Dw+iLtFRFmnbCQrCffKr19RAWRUXPCY3QDmaxX46k8f/ubs/B
2fzu4w2N0HDCT+h00DrkTh68YqUf9b3liC0as1MGPif8U3CURxl6yj6a1t50lHd0wNDszikY
hDYCw3ih7SSBAVwDUlCmY+CgvCf7SuRFinJonDwILFqEWIAv0IC07gBSGfryk8JOGnTwNCOT
aGY/cgRRnwlwwLQpOQr7W1aFSgXctwOsvSF9dSwsJwVY4HA0oKC5RzVaBrakRasjByAXEJk8
LMqxck0vdAxngQMwxYJl4YJjfCYszyEdG+cvBM0TqrvLXt5EMXwe5G98A8FBxhvfMN1tV9V+
v915hx+vxgfuOIk1oQcIAZC5aC0S0a4aHjMQLC8yUWIQTWvCcRL6gVR0gJyJHCw6cJdzAcOc
4HZltE1DHDHP4UmRTc75HPWryEzSGzXeaRJJ0EsZHKfUDq3DDk8WwJJgzcF/HBe9BFBry69v
b2jApzOAXNFJB4RF0ZywDtGNVrwtJnA4+JWRlDShE/g8nL7GBnpNQ6eOg03/4xi/pcd5VqiE
ZotIBIHkIolp6L2M+USm3LGRGnxFe3wR6EEH3bEAGzaefzwDLUPabY34IpNz533PJONXJZ0Y
00DH3aFj5pgFdt4tBbVpIDgJoZrpYzyNUf5qIoP87pONEn50w9DhSkEPmaBQFVFXLwJ3dwd4
lM75ZHxz3R9OZt0RMJ4yKiKtEQIWyXBxd2PDtTqG8CxSWTebkXChUFCVCEE3UoEjUAS1rE9u
pYmaYf14HUengbDIHw5OFuMkJqiA2LAiGwLAJ4lVJHJGLlFEnBx/mLBkLmP7pJNU5CbUIV/e
jyRx9lgbVlXCJsC0jsQYaH6kgaBjh6Da/RwAYKDDc3hbqaQ1m35d3hF2Y7wsp/xlu1kftjuT
Pmoft/X/8TFAZd/3T197sA5a3U2EYsz4Alx8h3rOE2D4EW0l5S3t6iPdTIySJAf77kqgRJID
m4LMue9H0a9a20hJRXRxgvlB40l0UoYwdE2HqDX05prKRM0ilYZgHq86Wbp2FPMqJNUG5ZJe
tAX/lMJHal/aK0yCANzNu4vv/ML8p3tHKaOSPNojC8BrgDMDfzPCX9S5bzdY65SmFIBJdUuB
yBAZKmwcCcxZF+KutzGtJsHvTxQG2lmhE0sO1WwS+GBmkvu7m2uLffKM5g69R5Be/4w1UBCC
OIFaJYIS6tZ1Bgi5muvD4yvYvEFh0OaVwOzXxlpPTXAMl2gGfig/XlxQ+byH8vLTRUcSHsqr
LmqPCk3mDshYCRkxF5QlTScLJSH2Qr88Q7b82OdKCLkwHkemOjcfwrdxDPMve9PrgHHmK/qS
eOTrsA00D+05wx3LYFGGfk4njRrFeSaCMFp6+2+180CzLr9WL9XmoFEYT6W3fcUydCfQqMMv
OgURuST0FDMhWfsJ9TIkiwSd8aYy4QW76n+P1Wb1w9uvls89a6I9i6yb3LKLCcTsE2H5+Fz1
aQ0LOhYtM+F0yz+9RE18dNw3A96blEuvOqzev7XXxSzBqFDETdb5AzTDnSKLckR9HFmOBCWh
oy4KvEo7wLHIP326oF1nrYMWKhiRV+U4sbmN9Wa5++GJl+PzsuG0rnRoz6mlNcDv1mPBZ8Y8
SwIKsYmfg/Xu5d/lrvL83fofk3psM8c+zceBzKJ7BkExWAWXbh0nyTgUJ9QBr+bV193Se2pW
f9Sr22UdB0IDHuy7W8SfdVyCmczyAt7ugfVtT6drAlNw60O1Qtl/91i9wlLIqa2U20skJqFo
2ctmpIwjadxUew9/FlFahmwkQkrpIkUd9UnMvBaxVopYS+Lo2/dsMkYg2ECRy7gcqXvWb5SQ
EDZh2o1IWE37ORkzimkKCgDeCj3BjGJHSUCViIIiNolRkWUQmMj4T6F/76HBRfVG9Pk0xUmS
THtAFG74PZfjIimIiraCG0aVVJf4qVweKFm0CabGTiCAh1X7Og6gLzPtDw0u3ezctOaYxHB5
P5Fg76VdVD/l4CCwWMQMxTHXFTA9o4d3dTkCjxA8jrL/jNhIBOatbrLpv04mxmBJYt+kzGoe
qtViB0+JL66Hw5Yg58TJfTmCg5qKaA8WyTnwbQtWejs9JCzUYG6syGJw4uFJpJ0875dVCD6Z
sMzHTDhEXb4wGUE9gyJCrN9UTrL6ivwiIt+zFdrzUJ1ezuVsyFKGy0vFAtFkAnqk6lHTNuWA
+UnhSOXKlJeme6VpxSI2WvuTdSqbxMBrCOHN+gnuftK1MT91YrYDHjRadMEuvWcOI/MJqDPz
HDo92X8zolmiz3oJPm3UL9A1OiXGUAfVK6a9MaSi7hNhSKNUwGJ9tQYi1wRNggPTWpkeABUh
aETUzSJEpgsJDaIhOlrp1BrabXbKLj0EMQdtQKq27qzbLgsl6aLRS3lo0eQh5sRHcN9goH0L
kGBnnhzXnuzVAMB6qvzmGtUUPo1FvHFPhqBWneagtPOmjy27t8ozZ0D96ebiHTgZ1teKuNOT
0IwNyvODx0jhEa8umzimq2jtYjJEzjxbpHnjU415Mnv313JfPXp/m+rr6277tH7utAadCCB2
2bgOpo2rLUueoXQKpMJiDJKDnX6c97spsa3VIKgO3V/zeBpSuptBYZHZznrVLE/l62thyDOB
sXwCatp+gRFqbsqBj00dLoXjFDEi1S15XbhmZQM/ByPn3mdgkl2TbWB3di9IM340eLaEY/al
EAUYQDyE7uZzo2T3FIJm7aYroRyJAP9BU1U3NGoOE9+r1fGw/Ou50g3Uns78HTrO+0jGQZSj
xqFbKQxY8Uw6MlI1RiQd5RrcH9pNMqpxbVDvMKpethCmRG0wOHCxz6admnxWxOKChR2Dc0pm
GRjBZPXkLrVSlwPMPMsRaMmBXcptdW/MgYg0K9ezBy5hgJ2b46JDEHN8aa5n6Szy9W/dhAd3
ZMcwhCnzBENf+8BTReUUmu5fbRdMb6ef3V1ffL6xUr2EQaRSrHZ1etqJqjj4C7EukzjyM3Tc
/ZC6EjYPo4IOOB/UsMGl5/vrunIT+XTKIyLTJQV4QEf9FnzIEWjwScQySiudpDLNhTH8rKOj
3dzcSQ84oz5savpTnoyHX/2zXtnheAdZKmYfTvSSGx0fl3fSIJhaIJNSnLNut2EbE69X9T68
ZJjpKkyX0ESEqasgI2Z5lAaOanQOfhBDH8TRrmPIn3IN+ouBwTZPaYDn7fKxTiA0cn0Ppof5
jnJJf6Kd4wmTe92ISWu40+GwOcLPwOl3nV4jiFnmaBwwCPh1RU0GrBe6sGe4XHeZFHni6I5H
8KwIsbljJEHTSDG0+sM3PSXeHjXrdZpr7WFLZGLlKPPktAAngUuwIjme5KcGH9BHdeNSywhm
aPDy8SwSnjq+vm53B3vHnXFjbtb7Vedszf0XUbRAO09uGTRCmChs/cCShOSOR1QQqtBZP2w2
m5fKD4TDfl6S5xICHjfy9tbJmh1pSPn5is9vSJ7uTa3zbN+Xe09u9ofd8UW3/e2/Ads/eofd
crNHPA+8ycp7hEtav+KP3STc/3u2ns6eD+BfekE6ZlYKb/vvBqXNe9liv7b3BpPN610FC1zy
t83HXHJzqJ4/yGjugY/l/Ze3q571h2LthbRoGgVZ1G/Sh6ZfHGIzYniWpN3RNj+YpP2ccm+R
yXZ/6JFrgXy5e+wD6/1T82oQMUtv3LnK9vVUqVAHuBPb5LzhiYreWlbjdGJ/kFn92Q1bHMcn
CclpHZHqRumtk6q4kjWS9XqN3AAQ/TpbP1ETLN3CuIyxQF1rS+q5Xo+H4YptJSBOi6HATeAd
NH/KD4mHU7r1HPya5deUl0a1VdeYRaIv46fDUsu2L0QcxOwKxG+5AuGiFFqe0x8WgA1ytXkD
aOqC4XlYqC1hTzjaG00jWZr2e0cb2f256mw8c2nPlN/+5+rmezlOHX3oseJuIOxobMrO7m6R
nMP/Unr1XIS8H6O2ta3BE1i5BX1W8K0LbOBMC5J6Bwn7JoZuimHnS05y8SXd6G2jW9hXtPVR
rrpiGtGASf8bpOal0qEgpnnqrZ63q7/7WltsdEiYThb42SCWAMEzxq9fsRysHwvcwijFLu3D
FuhV3uFb5S0fH9foqiyfDdX9e1udDRezNidjZ2Mlck/v48UT7J6u5Onum5LNHJ+SaCi2MNAB
tYFjFiGk5XRyHzmaB/IJxP+MPkfzESKhpJQa2X3A7SMrqgd/BBEbiT7qhXLGqzo+H9ZPx80K
X6bRVY/DImIU+KC6gb/paFCD57yc+C6+y9EtVJJfOedPRZSGjnZHJJ/fXH12dBgCWEWuwi0b
zT9dXOgwwD17obirURPAuSxZdHX1aY59gcx3NL4i4pdo3m/KaoztuZu21IoYF6Hz84dI+JI1
KaxhtLdbvn5br/aUvvEd7cYwXvrY9scH5BhMIYIJe9jg8dR7w46P6y14N6c+jLeDr/xbCr80
wdJ+cKlRqpkLmGhGcxgeBBBLn6uhKgt2y5fK++v49AQK3x/a3H5V/zSsudqXKjXVDFRydCBK
LWBCsuXq7+f1128H8NFC7p9xbACKf6dAYbcihip0Pg8rPNphcaM2Ud9PVj4FlH22sVRMUsRU
y14BKimZcFlCeJqHuudSsk6XJ2IQfNpycuSQIhEp/N7W0Z9xX4bCpxW3qXNKHTIviD0Ln/Em
6at4VlgfTGjQ4HObDHQWmJbuQMQ/Xt/cfrytIa3c5ty8CM2cqDsH4afJFEVsVARkExLmj7Ge
QL5ub551D8UcGdb1fWrh8LZmgQuAOUvCWe8gyAReLi4Gp4vWq912v306eJMfr9Xu3cz7eqwg
mNoPQ/6foVoXk7Ox6+NF3URZf19REnfeUdf4BxJKV2A/gShcnGi5PoMMQxYn8/OfdEzumzrC
4H64dnnU9rjr2N1TbnaqMl7K28tPVgEPRsUsJ0ZHoX8abR1dagU7HpPhKKHboWQSRYXT2mTV
y/ZQYTRLOQyYBMsxk0G7ucRkQ/T1Zf+VpJdGqmE1mmJnpgldYfE3Sn/D7iUbcPnXr2+9/Wu1
Wj+d8menKJu9PG+/wrDa8s76jc0iwGYeEISw2zVtCDVWYbddPq62L655JNxkzObph2BXVdja
V3lftjv5xUXkZ6gad/0+mrsIDGAa+OW4fIatOfdOwm2bgn/xYsBOc6yHfh/Q7ObhZrwgH5+a
fMpH/BIXWA6+1hvDBsvGVsxzp6uo61y0KDmUa3ofDW4Cc5kr2CWlJAcwO4rHpgtXjK8DGt13
lSVhSMSpELp1/rpEG2HVaWlEID0SHpXTJGZo8i+dWBgZpnNWXt7GEUahtNLtYCE98rW7W+2F
ZtzRyhjx0fDMw68tqEs/h2YnBIbGnW0ed9v1o32dLPazRPrkwRp0y3Fgjk7Vfi7IJMHuMaW7
Wm++Uv6lymnzVPezT8gtESQt/xgzw2T+QTpMigpl5ExD4dcH8HPc+/ypNcnmU3baHeoW3Oqy
Eqg9wyWWUfXNN2HgyluNma0z0/zBnkCZjiw6EBNztImAY0rHieODGd0NghgudwUo1G0n0qFU
AAM8L+lKCuq+O4fOMbDS+Zc7AnZm9pciyenHxdJVoK5LR0nQgF3QAFsnHLAEDgpuaw9sWHi5
+tYL2RRRtG58HoNtZHxfHR+3un+hZYVWZYCD4tqOhvGJDP1M0G+j/6oJ7fKZb7IdUPMPcUmN
whnu2VJkUpmwAFbPhcMxjR1/t6OI5fD7rVMx1RIX40BVq+NuffhBRSdTsXDU0gQvkF8h6BFK
Gx7d4nUW18UsnUZfmoJu6fi/yq6muW0jhv4VT049qB078TTtwQeKomSOKJLmUqGSi0axVVXj
WvX4Y6btr+8C2CW5IEA7pzgEuFzuJ5Z476mF1gzz2H6iODBFV7uoBwTJzOrqAwTKkN2a/Lt7
2E0gx/V4PE2ed3/sbTnHu8nx9LI/QHN8CFRA/tw93e1PsEB2rdQHyBzthnHc/XX8z38Haadn
WjukJEdcognguwCXaKuuLBDeeQ4wLc03RDnwKjGVEeGN2mCKj4jeoIZVrBjM3Oz4/QnoDE9/
v74cT+EchoiFrYws6LBjJ49LuyRAzhQ6WcCLW5csyRXrPM29YsM0DVLSsd0A0jEwShmnLcuC
mdjlDpkOWCGUSyqzNGQOxPYgF8dprWxtVXwhkznhvvrifJbKCDAwp/V6qxb7SaZeW8uvMjfe
WlSD/P01S6f4IE2FMJbJ85RB+fQRYGJzLk/ZRf7fQJdF6CZob9sPfRAYXYKdmeO4TKhJgngo
g99ltnbsLOpAQ8zRjwjaIc850DYsdOCpHydAexuOHrs1QJKkmM/6Qif9ewIudQftbqJsGSKz
QcRJaT83YwfzL1y7bu8Jz4pXH5/sGnePGZ27h/3zYYjos/+YAmOaBap8tMTqz6rHzTpN6qvL
FlVqAy4gwg5KuOzqrNaDFg8Siv0Z5fLsRn97/4yut05AVtqtCKUDYqtyOIekWTtzUbElEXGt
pLbRRFV+dXH+8TLshRLJHKrkFQBa8QmR0TK4UD8tmEgg82JQqygSB12rFIcY2ABTTyUbYu5A
8LCCTFMPzMgs+IZ2/8i+BlOC6legXmYSLT2YUA6/3ttBvaAmWsBS/tVUkmYXPZ1w5MNacWxr
f/Od7b+/Hg6cjg/jD9VYjBZ1M9EcOT5EPneTK9E1mssiNUWuRf/0lKoAedGBQC/zKqbAvpJw
2sSqoiayy6Hjf7DbvWXkCRSLrA2DkDKvLyr9FVdZ8iGm3rAWzjBSvMMKQ1Az/qpYWzgxzDMU
kpVexpuFkhz1ZRmZKPdLbzcp6DKWgVj5MHzqBhUn0kQ50ABIvquMhVpdM6CaA4va8s4yG36+
PtJMud6dDmEuoJjXjCklLxVDRpXS2GC0xxS7fQB1TXRqbsS0dO/MLde7PwfseQOC04KdkCV7
KzwQGHGnXNd9PQKSQKLhCiJZgxWbtToUsUySkk1DCk/h63jboWc/PduYH9EJk7OH15f9P3v7
B3B5f0H+sg944MyPZS9w/20zR/2z45fxkz+WAaeXsRkppA34fAERylFoatOQE6jzNWXEv/OE
S1FjtBMlOWCt9SWRnHySLbNt/kZZ0HwQavkQRn42PtUOZdTwUtfJ7kVH46Ef6PDgmOlk+eRH
w55pmwUEcG1oCbQQHS/lFmRa0MfaJx3dEMo37GZsz/F0zbG+jiv7JnmdRtnwewwIBIt7KygP
Iy9T7SbweLMv0UltbpQ3vjFSgN4TMO4t03xKOBnxbSUEMf6I4FqIk5+VL2lw6BZ9/IeXlqaq
iDuGxF104hzP1rqoovJa9vF8ZJHQHRqRrSnxap15RQS7KoGTMmeUkhQH1YEYwpz06m5ceeqe
M8IdyqI5H+lxoIquaMDA3TzZ3M/BqIMKw6gcxdwVEZtuvkerUmbFdcTC5WIWQADg/2Ox0XqK
QYXd1WoI1T1J0A8QsEoDB+9CJQH70pxcTjEXJAPgtzCQ9NCXtqWOtDHHPIsWRmpzyJfbKGla
GNRgqRW9ayLmjMgsY969foNn0chJAeJF6/qwbhfPpqj2rfXJapUWfG4F1XPyruL24M/1BcmP
bs83vwUiPD1DImPUWo/1TNUGb31yjTATl9HIZwdqCDsKlCxjqy+3nSur2jpv0hwaQdWO5I6g
GxnwT9inA3ZGxVisG4D0CyGzIjZVEA43Ub7JnFVSF+kCKWOoe2Fwih41yN6Nu0Rp/Hmz2bzn
eeD6+/tcEeJE6OpaxqT1eLuiHY8Z8jiIOSvf1FWhhJLdY+AXJpCBmAHNPBgk/wP4yKjGv2cA
AA==

--VbJkn9YxBvnuCH5J--
